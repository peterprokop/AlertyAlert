Pod::Spec.new do |s|
  s.name = 'AlertyAlert'
  s.version = '0.2.4'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'AlertyAlert is a nice and fluffy iOS alert library for all your alerty needs'
  s.homepage = 'https://github.com/peterprokop/AlertyAlert'
  s.authors = { 'Peter "Fatso" Prokop' => 'prokop.petr@gmail.com' }
  s.source = { :git => 'https://github.com/peterprokop/AlertyAlert.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.requires_arc = 'true'
  s.source_files = 'AlertyAlert/*.swift'
  s.resources = 'AlertyAlert/*.storyboard'
end