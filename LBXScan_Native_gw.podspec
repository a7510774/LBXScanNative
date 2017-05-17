Pod::Spec.new do |spec|
    spec.name         = 'LBXScan_Native_gw'
    spec.version      = '1.0.0'
    spec.summary      = 'ios 系统自带扫码封装'
    spec.homepage     = 'https://github.com/a7510774/LBXZBar'
    spec.license      = 'MIT'
    spec.authors      = {'gavin' => '260323117@qq.com'}
    spec.platform     = :ios, '8.0'
    spec.source       = {:git => 'https://github.com/a7510774/LBXScanNative.git', :tag => spec.version}
    spec.requires_arc = true

    spec.source_files = 'LBXScanNative/JMScanToWxZhifubao(LBX系统自带封装IOS8)/*','LBXScanNative/LBXNative/*','LBXScanNative/LBXUI/*.{h,m}'
    spec.resources     = 'LBXScanNative/LBXUI/CodeScan.bundle'
    spec.ios.frameworks = 'AVFoundation'

end
