Pod::Spec.new do |s|

  s.name         = "UIImage-ResizeNCrop"
  s.version      = "0.0.1"
  s.summary      = "Resizing UIImage on iOS"

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/Yabon14/UIImage-ResizeNCrop"
  s.license      = 'MIT'
  s.author       = { "Yann BONAFONS" => "yann.bonafons@gmail.com" }
  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/Yabon14/UIImage-ResizeNCrop.git", :tag => "0.0.1"}
  s.source_files  = '*.{h,m}'
  s.requires_arc = true

end
