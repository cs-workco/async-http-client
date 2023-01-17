//===----------------------------------------------------------------------===//
//
// This source file is part of the AsyncHTTPClient open source project
//
// Copyright (c) 2018-2019 Apple Inc. and the AsyncHTTPClient project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of AsyncHTTPClient project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
//
// AsyncAwaitEndToEndTests+XCTest.swift
//
import XCTest

///
/// NOTE: This file was generated by generate_linux_tests.rb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

extension AsyncAwaitEndToEndTests {
    static var allTests: [(String, (AsyncAwaitEndToEndTests) -> () throws -> Void)] {
        return [
            ("testSimpleGet", testSimpleGet),
            ("testSimplePost", testSimplePost),
            ("testPostWithByteBuffer", testPostWithByteBuffer),
            ("testPostWithSequenceOfUInt8", testPostWithSequenceOfUInt8),
            ("testPostWithCollectionOfUInt8", testPostWithCollectionOfUInt8),
            ("testPostWithRandomAccessCollectionOfUInt8", testPostWithRandomAccessCollectionOfUInt8),
            ("testPostWithAsyncSequenceOfByteBuffers", testPostWithAsyncSequenceOfByteBuffers),
            ("testPostWithAsyncSequenceOfUInt8", testPostWithAsyncSequenceOfUInt8),
            ("testPostWithFragmentedAsyncSequenceOfByteBuffers", testPostWithFragmentedAsyncSequenceOfByteBuffers),
            ("testPostWithFragmentedAsyncSequenceOfLargeByteBuffers", testPostWithFragmentedAsyncSequenceOfLargeByteBuffers),
            ("testCanceling", testCanceling),
            ("testDeadline", testDeadline),
            ("testImmediateDeadline", testImmediateDeadline),
            ("testConnectTimeout", testConnectTimeout),
            ("testSelfSignedCertificateIsRejectedWithCorrectErrorIfRequestDeadlineIsExceeded", testSelfSignedCertificateIsRejectedWithCorrectErrorIfRequestDeadlineIsExceeded),
            ("testInvalidURL", testInvalidURL),
            ("testRedirectChangesHostHeader", testRedirectChangesHostHeader),
            ("testShutdown", testShutdown),
            ("testCancelingBodyDoesNotCrash", testCancelingBodyDoesNotCrash),
            ("testAsyncSequenceReuse", testAsyncSequenceReuse),
            ("testRejectsInvalidCharactersInHeaderFieldNames_http1", testRejectsInvalidCharactersInHeaderFieldNames_http1),
            ("testRejectsInvalidCharactersInHeaderFieldNames_http2", testRejectsInvalidCharactersInHeaderFieldNames_http2),
            ("testRejectsInvalidCharactersInHeaderFieldValues_http1", testRejectsInvalidCharactersInHeaderFieldValues_http1),
            ("testRejectsInvalidCharactersInHeaderFieldValues_http2", testRejectsInvalidCharactersInHeaderFieldValues_http2),
        ]
    }
}
