//
//  JMScanVC.h
//  LBXScanNative
//
//  Created by chengw on 2017/5/11.
//  Copyright © 2017年 JM. All rights reserved.
//  封装原生扫码界面及功能：开关机、先相册、生成二维码图片

#import <UIKit/UIKit.h>
#import "LBXScanViewController.h"

typedef enum : NSUInteger {
    ScanUITypeWX,//微信（1条线+内框）
    ScanUITypeQQ,//QQ （1条线+外框）
    ScanUITypeZhiFuBao,//支付宝（网格）
} ScanUIType;


/**
 封装系统自带的QR扫码库
 */
@interface JMQRScanVC : LBXScanViewController


/**
 初始化方法

 @param type 扫码UI类型：WX/QQ/Alipay
 @param scanCodeType 默认二维码（自带只能识别一种码、不能同时识别）
 @param scanSuccessBlock 扫码返回的结果，包括选择图片
 */
+(instancetype)ScanWithUIType:(ScanUIType)type codeType:(ScanCodeType)scanCodeType doneBlock:(void (^)(NSString *resultStr))scanSuccessBlock;


@end


/**
 QR UIImageView 类别方法
 */
@interface UIImageView (ScanImage)

/**
 根据二维码字符生成对应二维码

 @param qrString qr字符
 */
- (void)imageWithQRString:(NSString *)qrString;


/**
 创建二维码

 @param qrString 字符
 @param logo 中间LOGO图 (处理成30*30)
 */
- (void)imageWithQRString:(NSString *)qrString logoImg:(UIImage *)logo;

/**
 根据条形码字符生成对应条形码
 
 @param barString bar字符
 */
- (void)imageWithBarString:(NSString *)barString;

@end
