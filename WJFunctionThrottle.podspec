Pod::Spec.new do |s|
  s.name             = 'WJFunctionThrottle'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight Objective-C function throttle and debounce library. '
  s.description      = <<-DESC
A lightweight Objective-C function throttle and debounce library.
                        DESC

  s.homepage         = 'https://github.com/wangwanjie/WJFunctionThrottle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangwanjie' => 'wangwanjie1993@gmail.com' }
  s.source           = { :git => 'https://github.com/wangwanjie/WJFunctionThrottle.git', :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.source_files = 'WJFunctionThrottle/**/*.{h,m}'
  s.source_files  = "WJFunctionThrottle", "WJFunctionThrottle/**/*.{h,m}"
  s.public_header_files = 'WJFunctionThrottle/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
