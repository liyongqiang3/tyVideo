//
//  UIImage+ColorFactory.m
//  iHotelMerchant
//
//  Created by 张宇 on 14-9-30.
//  Copyright (c) 2014年 psy. All rights reserved.
//

#import "UIImage+ColorFactory.h"

@implementation UIImage (ColorFactory)

+ (UIImage *)TY_createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
