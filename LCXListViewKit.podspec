#
# Be sure to run `pod lib lint LCXListViewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCXListViewKit'
  s.version          = '0.1.0'
  s.summary          = 'UITableView、UICollectionView的自定义cell与cell回调的便利使用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 父类SuperCell：自定义cell的便利使用； 列表cell中的元素响应事件：index区分与便利处理；UIView添加常用回调block属性
            DESC

  s.homepage         = 'https://github.com/xcodemanlcx/LCXListViewKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '475512103@qq.com' => 'leichunxiang58@163.com' }
  s.source           = { :git => 'https://github.com/xcodemanlcx/LCXListViewKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LCXListViewKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LCXListViewKit' => ['LCXListViewKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
