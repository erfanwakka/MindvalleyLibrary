#
# Be sure to run `pod lib lint MindvalleyLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MindvalleyLibrary'
  s.version          = '1.2.0'
  s.summary          = 'This is a library for Mindvalley project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
With this library you can download and load any source file easily.It also use caches to improve performance.
                       DESC

  s.homepage         = 'https://github.com/erfanwakka/MindvalleyLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erfan' => 'andesta.erfan@gmail.com' }
  s.source           = { :git => 'https://github.com/erfanwakka/MindvalleyLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
   s.swift_version = '4.0'
  s.source_files = 'MindvalleyLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MindvalleyLibrary' => ['MindvalleyLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
