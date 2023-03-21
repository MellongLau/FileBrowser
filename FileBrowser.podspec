#
# Be sure to run `pod lib lint FileBrowser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FileBrowser"
  s.version          = "1.3.3"
  s.summary          = "Powerful iOS file browser in Swift."
  s.description      = <<-DESC
                      A Swift file browser for iOS. Supports QuickLook, search and 3D touch.
                     DESC

  s.homepage         = "https://github.com/Nuglif/FileBrowser"
  s.license          = 'MIT'
  s.author           = { "Roy Marmelstein" => "marmelroy@gmail.com" }
  s.source           = { :git => "https://github.com/Nuglif/FileBrowser.git", :tag => s.version.to_s, :submodules => true}

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = "Sources/**/*.{swift}"
  s.resources = "Sources/FileBrowser/Resources/*.*"
  s.swift_version = '5.0'

  s.frameworks = 'QuickLook', 'WebKit'

end
