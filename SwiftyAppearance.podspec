#
# Be sure to run `pod lib lint SwiftyAppearance.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                    = 'SwiftyAppearance'
  s.version                 = '1.0.0'
  s.summary                 = 'Declarative approach to UIAppearance.'

  s.description             = <<-DESC
UIAppearance allows to set up global application look and feed in a single centralized location instead of
spreading bits of design across different classes, xibs and storyboards.
SwiftyAppearance adds a little bit of style to this approach.
                                 DESC

  s.homepage                = 'https://github.com/victor-pavlychko/SwiftyAppearance'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'Victor Pavlychko' => 'victor.pavlychko@gmail.com' }
  s.source                  = { :git => 'https://github.com/victor-pavlychko/SwiftyAppearance.git', :tag => s.version.to_s }
  s.social_media_url        = 'https://twitter.com/victorpavlychko'
  s.ios.deployment_target   = '9.0'
  s.source_files            = 'SwiftyAppearance/**/*'
  s.frameworks              = 'UIKit'
end
