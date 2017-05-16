//
//  JMScanVC.m
//  LBXScanNative
//
//  Created by chengw on 2017/5/11.
//  Copyright © 2017年 JM. All rights reserved.
//

#import "JMQRScanVC.h"
#import "StyleDIY.h"

@interface JMQRScanVC ()
@property (nonatomic,assign) ScanUIType type;
@property(nonatomic, copy) void (^scanSuccessBlock)(NSString *resultStr);
@end

@implementation JMQRScanVC

+(instancetype)ScanWithUIType:(ScanUIType)type codeType:(ScanCodeType)scanCodeType doneBlock:(void (^)(NSString *resultStr))scanSuccessBlock{
    JMQRScanVC *qrScanVC = [[JMQRScanVC alloc]init];
    switch (type) {
        case ScanUITypeQQ:
        {
            qrScanVC.style = [StyleDIY qqStyle];
        }
            break;
        case ScanUITypeWX:
        {
            qrScanVC.style = [StyleDIY weixinStyle];
        }
            break;
        case ScanUITypeZhiFuBao:
        {
            qrScanVC.style = [StyleDIY ZhiFuBaoStyle];
        }
            break;
            
        default:
            break;
    }
    qrScanVC.scanCodeType = scanCodeType;
    qrScanVC.isOpenInterestRect = YES;
    qrScanVC.scanSuccessBlock = scanSuccessBlock;
    
    return qrScanVC;
}
- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
    if (self.scanSuccessBlock) {
        
        self.scanSuccessBlock(strResult.strScanned);
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}


@end




@implementation UIImageView (ScanImage)
- (void)imageWithQRString:(NSString *)qrString
{
    self.image = [LBXScanNative createQRWithString:qrString QRSize:self.bounds.size];
}

- (void)imageWithQRString:(NSString *)qrString logoImg:(UIImage *)logo{
    
    [self imageWithQRString:qrString];
    
    CGSize logoSize=CGSizeMake(30, 30);
    UIImageView *logoImgView = [[UIImageView alloc]initWithImage:logo];
    logoImgView.bounds = CGRectMake(0, 0, logoSize.width, logoSize.height);
    logoImgView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    [self addSubview:logoImgView];
}


- (void)imageWithBarString:(NSString *)barString
{
    self.image = [LBXScanNative createBarCodeWithString:barString QRSize:self.bounds.size];
}

@end
