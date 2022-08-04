#
#  Be sure to run `pod spec lint HyperMark.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name             = "HyperMark"
  spec.version          = "1.0.1"
  spec.summary          = "A Swift powered HTML generator for web pages and HTML components."

  spec.description      = <<-DESC
    Use HyperMark to programmatically generate HTML for web pages, emails or components in existing web pages.
    HyperMark was created so you don't need to write any HTML by hand, but rather generate it through Swift programmatic logic.
    It can be used within a Vapor application to render pages or within a templating engine for creating HTML emails.
                   DESC

  spec.homepage         = "https://github.com/Develgo/HyperMark"
  spec.license          = "MIT"
  spec.author           = { "Nitesh Maharaj" => "nitesh.maharaj@develgo.com" }
  spec.swift_versions   = "5.0"
  spec.platform         = :ios, "14.0"
  spec.platform         = :osx, "11.0"
  spec.source           = { :git => "https://github.com/Develgo/HyperMark.git", :tag => "#{spec.version}" }
  spec.source_files     = "HyperMark", "HyperMark/HyperMark/**/*"
end
