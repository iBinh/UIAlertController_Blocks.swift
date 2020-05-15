
Pod::Spec.new do |s|
  s.name             = 'UIAlertController_Blocks.swift'
  s.version          = '1.0.1'
  s.summary          = 'Easy UIAlertController with blocks'
  s.homepage         = 'https://github.com/iBinh/UIAlertController_Blocks.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ntbinh21' => 'ntbinh21@gmail.com' }
  s.source           = { :git => 'https://github.com/iBinh/UIAlertController_Blocks.swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/UIAlertController_Blocks.swift/*'

end
