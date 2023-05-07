//
//  UrlRequestAdapterTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 07/05/23.
//

import XCTest
@testable import Planetz

class UrlRequestAdapterTests: XCTestCase {
    
    func testUrlRequestAdapter_checkValues_correct() {
        
        let expectedURL: String = "https://swapi.dev/api"
        let expectedHttpMethod: String = "GET"

        struct MockUrlRequestAdapter: UrlRequestAdapter {
            var urlString: String { "https://swapi.dev/api" }
            var method: HTTPMethod { .get }
            var parameters: Parameters? { nil }
        }

        let sut: BaseRequestAdapter = MockUrlRequestAdapter()
        
        XCTAssertEqual(expectedURL, sut.requestURLString)
        
        guard let urlRequest: URLRequest = sut.build() else {
            XCTFail("Failed to build URLRequest")
            return
        }
        
        if let actualUrlString = urlRequest.url?.absoluteString {
            XCTAssertEqual(expectedURL, actualUrlString)
        } else {
            XCTFail("Incorrect URL")
        }
        
        if let actualHttpMethod = urlRequest.httpMethod {
            XCTAssertEqual(expectedHttpMethod, actualHttpMethod)
        } else {
            XCTFail("Incorrect HTTP method")
        }

    }
}