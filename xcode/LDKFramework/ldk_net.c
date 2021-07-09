// This file is Copyright its original authors, visible in version control
// history.
//
// This file is licensed under the Apache License, Version 2.0 <LICENSE-APACHE
// or http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your option.
// You may not use this file except in accordance with one or both of these
// licenses.

/**
 * This file implements what you need to get networking up with LDK using
 * standard POSIX APIs. Its not particularly effecient (in fact quite the
 * opposite) but should be more than sufficient for most use-cases.
 */

#include "ldk_net.h"

#include <lightning.h>

#include <sys/socket.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <pthread.h>
#include <poll.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#ifndef MSG_NOSIGNAL
#define MSG_NOSIGNAL 0
#define IS_BSD
#endif

#define MAX_CONNS 1024
struct SocketHandler {
    const struct LDKPeerManager *ldk_peer_manager;
    pthread_t socket_thread;
    bool should_exit;
    int pipefds[2];
    // pollfds ands sockcount may only be written to with a lock on
    // sockets_mutex.
    // sockcount mut always be the number of sockets in pollfds
    // Items in pollfds may only be removed in the socket_thread, other threads
    // may only append new file descriptors at the end (via register_socket).
    pthread_mutex_t sockets_mutex;
    struct pollfd pollfds[MAX_CONNS];
    nfds_t sockcount;
};

int register_socket(struct SocketHandler* handler, int fd, int is_listen_sock) {
    int fd_flags = fcntl(fd, F_GETFL, 0);
    if (fd_flags < 0) return -1;
    if (fcntl(fd, F_SETFL, fd_flags | O_NONBLOCK) == -1) return -1;

    if (!is_listen_sock) {
        int opt = 1;
        if (setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, (void*)&opt, sizeof(opt))) return -1;
#ifdef IS_BSD
        if (setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, (void*)&opt, sizeof(opt))) return -1;
#endif
    }

    int lockres = pthread_mutex_lock(&handler->sockets_mutex);
    assert(lockres == 0);

    handler->pollfds[handler->sockcount].fd = fd;
    handler->pollfds[handler->sockcount].events = POLLIN;
    handler->pollfds[handler->sockcount].revents = 0;
    handler->sockcount++;
    assert(handler->sockcount <= MAX_CONNS);

    lockres = pthread_mutex_unlock(&handler->sockets_mutex);
    assert(lockres == 0);

    uint8_t dummy = 0;
    write(handler->pipefds[1], &dummy, 1);

    return 0;
}

struct Descriptor {
    struct SocketHandler *handler;
    int fd;
};

static uintptr_t sock_send_data(void* desc, struct LDKu8slice data, bool resume_read) {
    struct Descriptor *descriptor = (struct Descriptor*)desc;
    ssize_t write_count = send(descriptor->fd, data.data, data.datalen, MSG_NOSIGNAL);
    bool pause_read = false;
    if (write_count <= 0) {
        if (errno == EAGAIN || errno == EWOULDBLOCK) {
            pause_read = true;
            write_count = 0;
        } else {
            shutdown(descriptor->fd, SHUT_RDWR);
            uint8_t dummy = 0;
            write(descriptor->handler->pipefds[1], &dummy, 1);
            return 0;
        }
    } else if (write_count < data.datalen) {
        pause_read = true;
    }
    if (pause_read || resume_read) {
        int lockres = pthread_mutex_lock(&descriptor->handler->sockets_mutex);
        assert(lockres == 0);
        for (int i = 0; i < descriptor->handler->sockcount; i++) {
            if (descriptor->handler->pollfds[i].fd == descriptor->fd) {
                if (pause_read) {
                    descriptor->handler->pollfds[i].events &= POLLIN;
                    descriptor->handler->pollfds[i].events |= POLLOUT;
                } else {
                    descriptor->handler->pollfds[i].events |= POLLIN;
                }
                break;
            }
        }
        lockres = pthread_mutex_unlock(&descriptor->handler->sockets_mutex);
        assert(lockres == 0);
        uint8_t dummy = 0;
        write(descriptor->handler->pipefds[1], &dummy, 1);
    }

    return write_count;
}
static void sock_disconnect(void* desc) {
    struct Descriptor *descriptor = (struct Descriptor*)desc;
    shutdown(descriptor->fd, SHUT_RDWR);
    uint8_t dummy = 0;
    write(descriptor->handler->pipefds[1], &dummy, 1);
}
static bool sock_eq(const void* desc, const struct LDKSocketDescriptor *other_arg) {
    const struct Descriptor *descriptor = (const struct Descriptor*)desc;
    const struct Descriptor *other_descriptor = (const struct Descriptor*)other_arg->this_arg;
    return descriptor->fd == other_descriptor->fd;
}
static uint64_t sock_hash(const void* desc) {
    const struct Descriptor *descriptor = (const struct Descriptor*)desc;
    return (uint64_t)descriptor->fd;
}
static void* sock_clone(const void* desc) {
    const struct Descriptor *descriptor = (const struct Descriptor*)desc;
    struct Descriptor *new_desc = malloc(sizeof(struct Descriptor));
    new_desc->handler = descriptor->handler;
    new_desc->fd = descriptor->fd;
    return new_desc;
}
static void sock_free(void* desc) {
    free(desc);
}

static inline LDKSocketDescriptor get_descriptor(struct SocketHandler *handler, int fd) {
    struct Descriptor *desc = malloc(sizeof(struct Descriptor));
    desc->handler = handler;
    desc->fd = fd;
    LDKSocketDescriptor ret = {
        .this_arg = (void*)desc,
        .send_data = sock_send_data,
        .disconnect_socket = sock_disconnect,
        .eq = sock_eq,
        .hash = sock_hash,
        .clone = sock_clone,
        .free = sock_free,
    };
    return ret;
}

static void *sock_thread_fn(void* arg) {
    struct SocketHandler *handler = (struct SocketHandler*) arg;

    int lockres;
    struct pollfd pollfds[MAX_CONNS + 1];
    int fd_count;

    int close_socks[MAX_CONNS];
    int close_socks_count = 0;

    uint8_t readbuf[8192];

    while (!handler->should_exit) {
        {
            lockres = pthread_mutex_lock(&handler->sockets_mutex);
            assert(lockres == 0);
            memcpy(pollfds, handler->pollfds, sizeof(struct pollfd) * handler->sockcount);
            fd_count = handler->sockcount;
            lockres = pthread_mutex_unlock(&handler->sockets_mutex);
            assert(lockres == 0);
        }
        pollfds[fd_count].fd = handler->pipefds[0];
        pollfds[fd_count].events = POLLIN;
        fd_count++;

        int pollres = poll(pollfds, fd_count, 10000);
        assert(pollres != -1);
        close_socks_count = 0;

        read(pollfds[fd_count-1].fd, readbuf, sizeof(readbuf)); // Empty out the pipe

        if (pollres > 0) {
            for (int i = 0; i < fd_count - 1; i++) {
                if (pollfds[i].revents) {
                    LDKSocketDescriptor descriptor = get_descriptor(handler, pollfds[i].fd);
                    if (pollfds[i].revents & POLLIN) {
                        int readlen = read(pollfds[i].fd, readbuf, sizeof(readbuf));
                        if (readlen < 0) {
                            if (errno == EAGAIN || errno == EWOULDBLOCK) {
                                // Spurious wake.
                            } else if (errno == EINVAL || errno == ENOTCONN) {
                                // Assume we're a listening socket!
                                int newfd = accept(pollfds[i].fd, NULL, NULL);
                                if (newfd >= 0) {
                                    // Received a new connection, register it!
                                    LDKSocketDescriptor new_descriptor = get_descriptor(handler, newfd);
                                    LDKCResult_NonePeerHandleErrorZ con_res = PeerManager_new_inbound_connection(handler->ldk_peer_manager, new_descriptor);
                                    if (con_res.result_ok) {
                                        if (register_socket(handler, newfd, 0))
                                            shutdown(newfd, SHUT_RDWR);
                                    } else
                                        close(newfd);
                                    CResult_NonePeerHandleErrorZ_free(con_res);
                                } else {
                                    // Maybe it wasn't a listening socket, disconnect!
                                    close_socks[close_socks_count++] = i;
                                }
                            } else {
                                close_socks[close_socks_count++] = i;
                            }
                        } else if (readlen == 0) {
                            // EOF
                            close_socks[close_socks_count++] = i;
                        } else {
                            LDKu8slice data = {
                                .data = readbuf,
                                .datalen = readlen,
                            };
                            LDKCResult_boolPeerHandleErrorZ res = PeerManager_read_event(handler->ldk_peer_manager, &descriptor, data);
                            if (res.result_ok) {
                                if (*res.contents.result) {
                                    lockres = pthread_mutex_lock(&handler->sockets_mutex);
                                    assert(lockres == 0);
                                    assert(handler->pollfds[i - 1].fd == pollfds[i].fd); // Only we change fd order!
                                    handler->pollfds[i - 1].events &= POLLIN;
                                    handler->pollfds[i - 1].events |= POLLOUT;
                                    lockres = pthread_mutex_unlock(&handler->sockets_mutex);
                                    assert(lockres == 0);
                                }
                            } else {
                                close_socks[close_socks_count++] = i;
                            }
                            CResult_boolPeerHandleErrorZ_free(res);
                        }
                    }
                    if (pollfds[i].revents & POLLOUT) {
                        LDKCResult_NonePeerHandleErrorZ res = PeerManager_write_buffer_space_avail(handler->ldk_peer_manager, &descriptor);
                        if (!res.result_ok) {
                            close_socks[close_socks_count++] = i;
                        }
                        CResult_NonePeerHandleErrorZ_free(res);
                    }
                    SocketDescriptor_free(descriptor);
                }
            }
        }

        // We only do the actual socket disconnect handling in this thread,
        // other threads may append to pollfds and call shutdown().
        // Thus, in this thread, we first call socket_disconnected for each
        // socket we're gonna remove, then we walk the sockets and close() each
        // which should be disconnecting, shifting the remaining sockets down
        // as we walk.
        for (int i = 0; i < close_socks_count; i++) {
            LDKSocketDescriptor descriptor = get_descriptor(handler, handler->pollfds[close_socks[i]].fd);
            PeerManager_socket_disconnected(handler->ldk_peer_manager, &descriptor);
            SocketDescriptor_free(descriptor);
        }

        lockres = pthread_mutex_lock(&handler->sockets_mutex);
        assert(lockres == 0);
        int close_idx = 0;
        for (int i = 0; close_socks_count != 0 && i < handler->sockcount; i++) {
            if (close_idx < close_socks_count && close_socks[close_idx] == i) {
                close(handler->pollfds[i].fd);
                close_idx++;
            } else {
                handler->pollfds[i-close_idx] = handler->pollfds[i];
            }
        }
        assert(close_idx == close_socks_count);
        handler->sockcount -= close_socks_count;
        lockres = pthread_mutex_unlock(&handler->sockets_mutex);
        assert(lockres == 0);

        PeerManager_process_events(handler->ldk_peer_manager);
    }

    lockres = pthread_mutex_lock(&handler->sockets_mutex);
    assert(lockres == 0);
    for (int i = 0; i < handler->sockcount; i++) {
        LDKSocketDescriptor descriptor = get_descriptor(handler, handler->pollfds[i].fd);
        PeerManager_socket_disconnected(handler->ldk_peer_manager, &descriptor);
        SocketDescriptor_free(descriptor);
    }

    for (int i = 0; i < handler->sockcount; i++) {
        close(handler->pollfds[i].fd);
    }
    close(handler->pipefds[0]);
    close(handler->pipefds[1]);
    handler->sockcount = 0;
    lockres = pthread_mutex_unlock(&handler->sockets_mutex);
    assert(lockres == 0);

    return NULL;
}


void* init_socket_handling(const struct LDKPeerManager *NONNULL_PTR ldk_peer_manager) {
    struct SocketHandler *handler = NULL;

    handler = (struct SocketHandler*) calloc(1, sizeof(struct SocketHandler));
    if (!handler) goto err;
    handler->pipefds[0] = -1;
    handler->pipefds[1] = -1;

    handler->ldk_peer_manager = ldk_peer_manager;
    handler->should_exit = false;

    if (pipe(handler->pipefds) != 0) goto err;

    int fd_flags = fcntl(handler->pipefds[0], F_GETFL, 0);
    if (fd_flags < 0) goto err;
    if (fcntl(handler->pipefds[0], F_SETFL, fd_flags | O_NONBLOCK) == -1) goto err;

    if (pthread_mutex_init(&handler->sockets_mutex, NULL) != 0) goto err;
    if (pthread_create(&handler->socket_thread, NULL, sock_thread_fn, handler) != 0) {
        pthread_mutex_destroy(&handler->sockets_mutex);
        goto err;
    }

    return handler;

err:
    if (handler) {
        if (handler->pipefds[0] != -1) close(handler->pipefds[0]);
        if (handler->pipefds[1] != -1) close(handler->pipefds[1]);
        free(handler);
    }
    return NULL;
}

void interrupt_socket_handling(void* arg) {
    struct SocketHandler *handler = (struct SocketHandler*) arg;
    handler->should_exit = true;
    uint8_t dummy = 0;
    write(handler->pipefds[1], &dummy, 1);
    void *retval;
    int ret = pthread_join(handler->socket_thread, &retval);
    assert(ret == 0);
    free(handler);
}

int socket_connect(void* arg, LDKPublicKey pubkey, struct sockaddr *addr, size_t addrlen) {
    struct SocketHandler *handler = (struct SocketHandler*) arg;

    int fd = socket(addr->sa_family, SOCK_STREAM, 0);
    if (fd < 0) return -1;

    struct timeval timeout;
    timeout.tv_sec = 1;
    timeout.tv_usec = 0;
    if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout))) return -2;
    if (connect(fd, addr, addrlen)) return -3;
    timeout.tv_sec = 120;
    if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout))) return -3;

    if (register_socket(handler, fd, 0)) return -4;

    LDKSocketDescriptor descriptor = get_descriptor(handler, fd);

    LDKCResult_CVec_u8ZPeerHandleErrorZ con_res = PeerManager_new_outbound_connection(handler->ldk_peer_manager, pubkey, descriptor);
    if (con_res.result_ok) {
        LDKu8slice send_data = {
            .data = con_res.contents.result->data,
            .datalen = con_res.contents.result->datalen,
        };
        if (sock_send_data(descriptor.this_arg, send_data, true) != con_res.contents.result->datalen)
            shutdown(fd, SHUT_RDWR);
    } else {
        shutdown(fd, SHUT_RDWR);
    }
    CResult_CVec_u8ZPeerHandleErrorZ_free(con_res);

    return 0;
}

int socket_bind(void* arg, struct sockaddr *addr, socklen_t addrlen) {
    struct SocketHandler *handler = (struct SocketHandler*) arg;
    int fd = socket(addr->sa_family, SOCK_STREAM, 0);
    if (fd < 0) return -1;

    int reuseon = 1;
    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &reuseon, sizeof(reuseon))) return -2;

    if (bind(fd, addr, addrlen)) return -3;
    if (listen(fd, 32)) return -4;

    if (register_socket(handler, fd, 1)) return -5;

    return 0;
}
