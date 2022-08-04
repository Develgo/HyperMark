//
//  HtmlTag.swift
//  HyperMark
//
//  Created by Nitesh Maharaj on 2022/08/04.
//

import Foundation

public struct HtmlTag: Renderable {
    public let name: String
    public var attributes: [String: String] = [:]
    public let text: String?
    public var nestedTags: [Renderable] = []
    
    public init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    public init(name: String, attributes: [String: String] = [:], text: String? = nil, nestedTags: [Renderable] = []) {
        self.name = name
        self.attributes = attributes
        self.text = text
        self.nestedTags = nestedTags
    }
    
    public mutating func addAttribute(key: String, value: String) {
        attributes[key] = value
    }
    
    public mutating func add(tag: HtmlTag) {
        nestedTags.append(tag)
    }
    
    public func render() -> String {
        if text == nil && nestedTags.isEmpty {
            return "<\(name)\(renderAttributes())>"
        }
        return "<\(name)\(renderAttributes())>\(text ?? "")\(renderNestedTags())</\(name)>"
    }
    
    private func renderAttributes() -> String {
        if attributes.isEmpty {
            return ""
        }
        
        var output = ""
        for (key, value) in attributes.sorted(by: { $0.key < $1.key }) {
            output += " \(key)=\"\(value)\""
        }
        return output
    }
    
    private func renderNestedTags() -> String {
        if nestedTags.isEmpty {
            return ""
        }
        
        var output = ""
        for tag in nestedTags {
            output += "\n\(tag.render())"
        }
        return output + "\n"
    }
}
