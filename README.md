# iOS 二维码、条形码 
系统自带扫码及识别本地相册封装，（IOS8后可用）扫码功能及UI封装，感谢https://github.com/MxABC/LBXScan

# 使用介绍
```obj-c

#import "JMQRScanVC.h"

- (IBAction)btnClick:(id)sender {
    JMQRScanVC *vc = [JMQRScanVC ScanWithUIType:ScanUITypeZhiFuBao codeType:ScanCodeTypeQR doneBlock:^(NSString *resultStr) {
        //扫码成功回调
        NSLog(@"%@",resultStr);
        
        //根据Sting创建QR图片
        [self.qrImgView imageWithQRString:resultStr];

    }];
    
    [self.navigationController pushViewController:vc animated:YES];
}


    ios10后，需要在info.plist文件中添加下面内容

    <!-- 相册 -->
    <key>NSPhotoLibraryUsageDescription</key>
    <string>App需要您的同意,才能访问相册</string>
    <!-- 相机 -->
    <key>NSCameraUsageDescription</key>
    <string>App需要您的同意,才能访问相机</string>

```
