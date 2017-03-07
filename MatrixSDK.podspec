Pod::Spec.new do |s|
  s.name         = "MatrixSDK"
  s.version      = "0.1.0"
  s.summary      = "Unofficial iOS SDK to build apps compatible with Matrix (https://www.matrix.org)"
  s.description  = <<-DESC
    Unofficial iOS SDK to build apps compatible with Matrix (https://www.matrix.org).
  DESC
  s.homepage     = "https://github.com/gperdomor/MatrixSDK"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Gustavo Perdomo" => "gperdomor@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.1"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/gperdomor/MatrixSDK.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
