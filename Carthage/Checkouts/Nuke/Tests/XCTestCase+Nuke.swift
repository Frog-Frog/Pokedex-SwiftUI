// The MIT License (MIT)
//
// Copyright (c) 2015-2020 Alexander Grebenyuk (github.com/kean).

import XCTest
import Foundation
@testable import Nuke

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

#if os(macOS)
import Cocoa
#endif

extension XCTestCase {
    func expect(_ pipeline: ImagePipeline) -> TestExpectationImagePipeline {
        return TestExpectationImagePipeline(test: self, pipeline: pipeline)
    }
}

struct TestExpectationImagePipeline {
    let test: XCTestCase
    let pipeline: ImagePipeline

    @discardableResult
    func toLoadImage(with request: ImageRequest, progress: ImageTask.ProgressHandler? = nil, completion: ((Result<ImageResponse, ImagePipeline.Error>) -> Void)? = nil) -> ImageTask {
        let expectation = test.expectation(description: "Image loaded for \(request)")
        return pipeline.loadImage(with: request, progress: progress) { result in
            completion?(result)
            XCTAssertTrue(Thread.isMainThread)
            XCTAssertTrue(result.isSuccess)
            expectation.fulfill()
        }
    }

    @discardableResult
    func toFailRequest(_ request: ImageRequest, progress: ImageTask.ProgressHandler? = nil, completion: ((Result<ImageResponse, ImagePipeline.Error>) -> Void)? = nil) -> ImageTask {
        let expectation = test.expectation(description: "Image request failed \(request)")
        return pipeline.loadImage(with: request, progress: progress) { result in
            completion?(result)
            XCTAssertTrue(Thread.isMainThread)
            XCTAssertTrue(result.isFailure)
            expectation.fulfill()
        }
    }

    func toFailRequest(_ request: ImageRequest, with expectedError: ImagePipeline.Error, file: StaticString = #file, line: UInt = #line) {
        toFailRequest(request) { result in
            XCTAssertEqual(result.error, expectedError, file: file, line: line)
        }
    }

    func toLoadData(with request: ImageRequest) {
        let expectation = test.expectation(description: "Data loaded for \(request)")
        pipeline.loadData(with: request, progress: nil) { result in
            XCTAssertTrue(Thread.isMainThread)
            switch result {
            case .success:
                break
            case let .failure(error):
                XCTFail("Failed to load data with error: \(error)")
            }
            expectation.fulfill()
        }
    }
}

extension XCTestCase {
    func expectToFinishLoadingImage(with request: ImageRequest, options: ImageLoadingOptions = ImageLoadingOptions.shared, into imageView: ImageDisplayingView, completion: ImageTask.Completion? = nil) {
        let expectation = self.expectation(description: "Image loaded for \(request)")
        Nuke.loadImage(
            with: request,
            options: options,
            into: imageView,
            completion: { result in
                XCTAssertTrue(Thread.isMainThread)
                completion?(result)
                expectation.fulfill()
        })
    }

    func expectToLoadImage(with request: ImageRequest, options: ImageLoadingOptions = ImageLoadingOptions.shared, into imageView: ImageDisplayingView) {
        expectToFinishLoadingImage(with: request, options: options, into: imageView) { result in
            XCTAssertTrue(result.isSuccess)
        }
    }
}

// MARK: - UIImage

func XCTAssertEqualImages(_ lhs: PlatformImage, _ rhs: PlatformImage, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(isEqual(lhs, rhs), "Expected images to be equal", file: file, line: line)
}

private func isEqual(_ lhs: PlatformImage, _ rhs: PlatformImage) -> Bool {
    guard lhs.sizeInPixels == rhs.sizeInPixels else {
        return false
    }

    // Note: this will probably need more work.
    let encoder = ImageEncoders.ImageIO(type: .png, compressionRatio: 1)
    let lhs = encoder.encode(lhs)
    let rhs = encoder.encode(rhs)

    return lhs == rhs
}
