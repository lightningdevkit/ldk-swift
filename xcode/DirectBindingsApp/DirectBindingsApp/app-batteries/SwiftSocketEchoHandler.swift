//
//  SwiftSocketPeerHandler.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/21/21.
//

import Foundation
import SwiftSocket

class SwiftSocketEchoHandler: ObservableObject {
    
    private let server: TCPServer
    private var ioWorkItem: DispatchWorkItem?
    private var shutdown = false
    fileprivate var peers = [UInt64: TcpPeer]()
    @Published public var connectedPeers: [(UInt64, String)] = []
    
    private static var runningCounter: Int64 = 0
    
    init() {
        self.server = TCPServer(address: "127.0.0.1", port: 9736)
        
        self.ioWorkItem = DispatchWorkItem {
            if self.server.listen().isSuccess {
                print("Echo Server listening")
                var lastTimerTick = NSDate().timeIntervalSince1970
                while !self.shutdown {
                    if let client = self.server.accept() {
                        print("Got a client! \(client.address):\(client.port)")
                        let peer = self.setupSocket(client: client)
                        self.peers[peer.ourId] = peer
                        DispatchQueue.main.async {
                            self.connectedPeers.append((peer.ourId, "\(client.address):\(client.port)"))
                            peer.doRead()
                        }
                    }
                }
            }
        }
        
        let backgroundQueue = DispatchQueue(label: "org.ldk.SwiftSocketEchoHandler.ioThread", qos: .background)
        backgroundQueue.async(execute: self.ioWorkItem!)
    }
    
    fileprivate func setupSocket(client: TCPClient) -> TcpPeer {
        OSAtomicIncrement64(&SwiftSocketEchoHandler.runningCounter)
        let socketDescriptor = TcpPeer(tcpClient: client, ourId: SwiftSocketEchoHandler.runningCounter)
        return socketDescriptor
    }
    
    public func connect(address: String, port: Int32, theirNodeId: [UInt8]) {
        let client = TCPClient(address: address, port: port)
        let peer = setupSocket(client: client)
        self.peers[peer.ourId] = peer
    }
    
    public func disconnect(connectionId: UInt64){
        if let peer = self.peers[connectionId] {
            peer.disconnectPeer()
        }
    }
    
    public func interrupt() {
        self.shutdown = true
        if let workItem = self.ioWorkItem {
            workItem.wait()
        }
    }
    
}

private class TcpPeer: SocketDescriptor {
    /**
     * When we are told by LDK to disconnect, we can't return to LDK until we are sure
     * won't call any more read/write PeerManager functions with the same connection.
     * This is set to true if we're in such a condition (with disconnect checked
     * before with the Peer monitor lock held) and false when we can return.
     */
    var blockDisconnectSocket = false
    
    /**
     * Indicates LDK told us to disconnect this peer, and thus we should not call socket_disconnected.
     */
    var disconnectRequested = false
    
    let client: TCPClient
    let ourId: UInt64
    let dispatchQueue: DispatchQueue
    var workItems: [DispatchWorkItem] = []
    
    init(tcpClient: TCPClient, ourId: Int64) {
        self.client = tcpClient
        self.ourId = UInt64(ourId)
        self.dispatchQueue = DispatchQueue(label: "org.ldk.SwiftSocketPeerHandler.peerThread:\(self.ourId)", qos: .background)
        super.init()
    }
    
    fileprivate func doRead() {
        guard let bytesAvailable = self.client.bytesAvailable() else {
            print("invalid bytes available from peer #\(self.ourId), disconnecting")
            self.disconnect_socket()
            return
        }
        print("\(bytesAvailable) bytes available from peer #\(self.ourId)")
        let workItem = DispatchWorkItem {
            if bytesAvailable == 0 {
                Thread.sleep(forTimeInterval: 1)
                self.doRead()
                return
            }
            print("starting read from peer #\(self.ourId)")
            guard let readData = self.client.read(Int(bytesAvailable)) else {
                print("read failed from peer #\(self.ourId), disconnecting")
                self.disconnect_socket()
                return
            }
            let readBytes = [UInt8](readData)
            print("Read from peer #\(self.ourId):\n\(readBytes)\n")
            
            // after read, always write
            self.send_data(data: readData, resume_read: true)
            
        }
        self.workItems.append(workItem)
        self.dispatchQueue.async(execute: workItem)
    }
    
    override func send_data(data: [UInt8], resume_read: Bool) -> UInt {
        defer {
            // do the read at the end
            if resume_read {
                self.doRead()
            }
        }
        let result = self.client.send(data: Data(data))
        if result.isSuccess {
            print("Write to peer #\(self.ourId):\n\(data)\n")
            return UInt(data.count)
        }
        return 0
    }
    
    fileprivate func disconnectPeer() {
        self.client.close()
        
    }
    
    override func disconnect_socket() {
        self.client.close()
    }
    override func hash() -> UInt64 {
        return self.ourId
    }
    override func eq(other_arg: SocketDescriptor) -> Bool {
        let comparable = other_arg as! TcpPeer
        return comparable.ourId == self.ourId
    }

}
