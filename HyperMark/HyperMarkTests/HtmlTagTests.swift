//
//  HtmlTagTests.swift
//  HyperMarkTests
//
//  Created by Nitesh Maharaj on 2022/08/04.
//

import XCTest
@testable import HyperMark

class HtmlTagTests: XCTestCase {
    func testSelfClosingImageTag() throws {
        let expected = "<img alt=\"circle\" src=\"img/circle\">"
        var imageTag = HtmlTag(name: "img", text: nil)
        imageTag.addAttribute(key: "src", value: "img/circle")
        imageTag.addAttribute(key: "alt", value: "circle")
        let output = imageTag.render()
        XCTAssert(expected == output)
    }
    
    func testLineBreakTag() throws {
        let expected = "<br>"
        let br = HtmlTag(name: "br", text: nil)
        let output = br.render()
        XCTAssert(expected == output)
    }
    
    func testParagraphTag() throws {
        let expected = "<p>Hello World!</p>"
        let p = HtmlTag(name: "p", text: "Hello World!")
        let output = p.render()
        XCTAssert(expected == output)
    }
    
    func testFormWithNestedTags() throws {
        let expected = """
            <form action=\"endpoint\" method=\"post\">
            <label for=\"fname\">First Name:</label>
            <input id=\"fname\" name=\"fname\" type=\"text\">
            </form>
            """
        var form = HtmlTag(name: "form", attributes: ["action": "endpoint", "method": "post"], text: nil)
        form.add(tag: HtmlTag(name: "label", attributes: ["for": "fname"], text: "First Name:"))
        form.add(tag: HtmlTag(name: "input", attributes: ["type": "text", "id": "fname", "name": "fname"], text: nil))
        let output = form.render()
        XCTAssert(expected == output)
    }
}
