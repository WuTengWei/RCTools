
Pod::Spec.new do |s|
  s.name             = 'RCTools'
  s.version          = '0.1.3'
  s.summary          = 'RCTools'
  s.description      = <<-DESC
     long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/WuTengWei/RCTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WuTengWei' => '15239184251@126.com' }
  s.source           = { :git => 'https://github.com/WuTengWei/RCTools.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files = 'RCTools/Classes/**/*.{h,m}'
  s.requires_arc = true

  # s.resource_bundles = {
  #   'RCTools' => ['RCTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #s.dependency 'TTTAttributedLabel', '~> 2.0.0'
end
