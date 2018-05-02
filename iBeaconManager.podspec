#
# Be sure to run `pod lib lint iBeaconManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iBeaconManager'
  s.version          = '0.1.0'
  s.summary          = 'A super simple way to integrate iBeacons in your swift project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iBeaconManager provides an extra layer of abstraction that allows you to easily integrate and use iBeacons or Bluetooth Low Energy beacons in your Swift project.
                       DESC

  s.homepage         = 'https://github.com/oct0f1sh/iBeaconManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oct0f1sh' => 'buzzbuzz.macdonald@gmail.com' }
  s.source           = { :git => 'https://github.com/oct0f1sh/iBeaconManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'iBeaconManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iBeaconManager' => ['iBeaconManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
