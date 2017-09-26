//
//  RNAwesomeIndicator.m
//  RNAwesomeIndicator
//
//  Created by Yunus Alkan on 23/09/2017.
//  Copyright © 2017 Yunus Alkan. All rights reserved.
//

#import "RNAwesomeIndicator.h"
#import "SVProgressHUD.h"

@interface RNAwesomeIndicator()


@end

@implementation RNAwesomeIndicator

+ (void)initialize
{
    if (self == [RNAwesomeIndicator class]) {
        [SVProgressHUD setDefaultStyle: SVProgressHUDStyleCustom];
        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
        [SVProgressHUD setDefaultMaskType: SVProgressHUDMaskTypeGradient];
        [SVProgressHUD setBackgroundColor: [UIColor clearColor]];
    }
}

-(UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(show:(NSString *)message)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([message isEqualToString:@""]) {
            [SVProgressHUD show];
        } else {
            [SVProgressHUD showWithStatus:message];
        }
    });
}

RCT_EXPORT_METHOD(dismiss)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

RCT_EXPORT_METHOD(updateSettings:(NSDictionary *)settings)
{
    NSString *foregroundColor = [settings valueForKey:@"foregroundColor"];
    if (foregroundColor) {
        [SVProgressHUD setForegroundColor: [self colorFromHexString:foregroundColor]];
    }
    
    NSString *backgroundColor = [settings valueForKey:@"backgroundColor"];
    if (backgroundColor) {
        [SVProgressHUD setBackgroundColor: [self colorFromHexString:backgroundColor]];
    }
}

@end

