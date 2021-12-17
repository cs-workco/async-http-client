//===----------------------------------------------------------------------===//
//
// This source file is part of the AsyncHTTPClient open source project
//
// Copyright (c) 2021 Apple Inc. and the AsyncHTTPClient project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of AsyncHTTPClient project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

#if compiler(>=5.5) && canImport(_Concurrency)
import struct Foundation.URL
import NIOHTTP1

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
extension HTTPClientRequest {
    struct Prepared {
        var url: URL
        var poolKey: ConnectionPool.Key
        var requestFramingMetadata: RequestFramingMetadata
        var head: HTTPRequestHead
        var body: Body?
    }
}

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
extension HTTPClientRequest.Prepared {
    init(_ request: HTTPClientRequest) throws {
        guard let url = URL(string: request.url) else {
            throw HTTPClientError.invalidURL
        }

        let deconstructedURL = try DeconstructedURL(url: url)

        var headers = request.headers
        headers.addHostIfNeeded(for: deconstructedURL)
        let metadata = try headers.validateAndSetTransportFraming(
            method: request.method,
            bodyLength: .init(request.body)
        )

        self.init(
            url: url,
            poolKey: .init(url: deconstructedURL, tlsConfiguration: nil),
            requestFramingMetadata: metadata,
            head: .init(
                version: .http1_1,
                method: request.method,
                uri: deconstructedURL.uri,
                headers: headers
            ),
            body: request.body
        )
    }
}

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
extension RequestBodyLength {
    init(_ body: HTTPClientRequest.Body?) {
        switch body?.mode {
        case .none:
            self = .fixed(length: 0)
        case .byteBuffer(let buffer):
            self = .fixed(length: buffer.readableBytes)
        case .sequence(nil, _, _), .asyncSequence(nil, _):
            self = .dynamic
        case .sequence(.some(let length), _, _), .asyncSequence(.some(let length), _):
            self = .fixed(length: length)
        }
    }
}

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
extension HTTPClientRequest.Prepared {
    func followingRedirect(to redirectURL: URL, status: HTTPResponseStatus) -> HTTPClientRequest {
        let (method, headers, body) = transformRequestForRedirect(
            from: self.url,
            method: self.head.method,
            headers: self.head.headers,
            body: self.body,
            to: redirectURL,
            status: status
        )
        var newRequest = HTTPClientRequest(url: redirectURL.absoluteString)
        newRequest.method = method
        newRequest.headers = headers
        newRequest.body = body
        return newRequest
    }
}

#endif