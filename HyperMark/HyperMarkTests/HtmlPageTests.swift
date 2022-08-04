//
//  HyperMarkTests.swift
//  HyperMarkTests
//
//  Created by Nitesh Maharaj on 2022/08/03.
//

import XCTest
@testable import HyperMark

class HtmlPageTests: XCTestCase {
    func testDefaultPage() throws {
        let expected = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
            <meta charset="utf-8">
            <title>Hello</title>
            </head>
            <body>
            <br>
            </body>
            </html>
            """
        let doc = HtmlPage(title: "Hello")
        let output = doc.render()
        XCTAssert(expected == output)
    }
}
