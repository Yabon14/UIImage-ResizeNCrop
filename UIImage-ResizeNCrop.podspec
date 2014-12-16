Pod::Spec.new do |s|
    s.name         = 'UIImage-ResizeNCrop'
    s.version      = '0.0.5'
    s.license      = 'MIT'
    s.summary      = 'Resizing UIImage on iOS'
    s.author = {
        'Yann BONAFONS' => 'yann.bonafons@gmail.com'
            }
    s.source = {
        :git => 'https://github.com/Yabon14/UIImage-ResizeNCrop.git',
        :tag => s.version.to_s
            }
    s.source_files = '*.{h,m}'
    s.requires_arc = true
end