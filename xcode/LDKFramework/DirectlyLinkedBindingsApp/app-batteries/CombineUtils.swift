//
//  CombineUtils.swift
//  DirectBindingsApp
//
//  From https://www.swiftbysundell.com/articles/async-and-concurrent-forEach-and-map/
//
//  Created by Jurvis Tan on 4/18/22.
//

import Foundation
import Combine

//extension Publisher {
//    public func asyncMap<T>(
//        _ transform: @escaping (Output) async throws -> T
//    ) -> Publishers.FlatMap<Future<T, Error>,
//                            Publishers.SetFailureType<Self, Error>> {
//        flatMap { value in
//            Future { promise in
//                Task {
//                    do {
//                        let output = try await transform(value)
//                        promise(.success(output))
//                    } catch {
//                        promise(.failure(error))
//                    }
//                }
//            }
//        }
//    }
//}
