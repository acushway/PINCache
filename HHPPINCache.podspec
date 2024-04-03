Pod::Spec.new do |s|
  s.name          = 'HHPPINCache'
  s.version       = '3.0.5'
  s.homepage      = 'https://github.com/acushway/PINCache'
  s.summary       = 'Fast, thread safe, parallel object cache for iOS and OS X.'
  s.authors       = { 'Garrett Moon' => 'garrett@pinterest.com', 'Justin Ouellette' => 'jstn@tumblr.com' }
  s.source        = { :git => 'https://github.com/acushway/PINCache.git', :tag => "#{s.version}" }
  s.license       = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  s.requires_arc  = true
  s.frameworks    = 'Foundation'
  s.ios.weak_frameworks   = 'UIKit'
  s.osx.weak_frameworks   = 'AppKit'
  s.ios.deployment_target = '13.0'
  pch_PIN = <<-EOS
#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif

  s.resource_bundles = {
    'HHPPINCache' => ['Resources/*.xcprivacy']
  }

EOS
  s.prefix_header_contents = pch_PIN
  s.subspec 'Core' do |sp|
      sp.source_files  = 'Source/*.{h,m}'
      sp.dependency 'HHPPINOperation', '~> 1.2.4'
  end
  s.subspec 'Arc-exception-safe' do |sp|
      sp.dependency 'HHPPINCache/Core'
      sp.source_files = 'Source/PINDiskCache.m'
      sp.compiler_flags = '-fobjc-arc-exceptions'
  end
end
