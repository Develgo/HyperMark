//
//  HtmlPage.swift
//  HyperMark
//
//  Created by Nitesh Maharaj on 2022/08/03.
//

import Foundation

public protocol Renderable {
    func render() -> String
}

public struct HtmlPage: Renderable {
    public var language: String = "en"
    public var characterSet: String = "utf-8"
    public var title: String
    public var body: HtmlTag = {
        var tag = HtmlTag(name: "body", text: nil)
        tag.add(tag: HtmlTag(name: "br", text: nil))
        return tag
    }()
    
    public func render() -> String {
        let doc = """
            <!DOCTYPE html>
            <html lang="\(language)">
            <head>
            <meta charset="\(characterSet)">
            <title>\(title)</title>
            </head>
            \(body.render())
            </html>
            """
        return doc
    }
}
