#
# Be sure to run `pod lib lint LGTagsView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LGTagsView'
  s.version          = '0.1.1'
  s.summary          = 'Easily display your tags text with pretty look.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Easily display your tags text with pretty look. Compatible with AutoLayout.
                       DESC

  s.homepage         = 'https://github.com/yuzhouwww/LGTagsView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '于宙' => 'yuzhouwww@gmail.com' }
  s.source           = { :git => 'https://github.com/yuzhouwww/LGTagsView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/yuzhouwww'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LGTagsView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LGTagsView' => ['LGTagsView/Assets/*.png']
  # }

  s.public_header_files = 'LGTagsView/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
