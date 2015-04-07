Pod::Spec.new do |s|
  s.name         = 'ZYCoreFramework'
  s.version      = '1.0'
  s.license      =  { :type => 'MIT' }
  s.homepage     = 'https://bitbucket.org/yun_zeng/zycoreframework'
  s.authors      =  {"Programmer Du" => "zengyun.programmer@gmail.com"}
  s.summary      = "It's a iOS Core Framework"

# Source Info
  s.source       =  {:git => 'git@bitbucket.org:yun_zeng/zycoreframework.git'}
  s.source_files = 'Core/*.{h,m}'

  s.requires_arc = true
  
# Pod Dependencies

end