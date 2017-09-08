//
//  UIColor+FZColor.h
//  FangZhou
//
//  Created by wtw on 16/6/6.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FZColor)

/**
 *  十六进制数据转换成RGB颜色
 *
 *  @param hexColro 十六进制数据值
 *
 *  @return 返回RGB颜色
 */
+ (UIColor *) getColor: (NSString *)hexColro;

/**
 *  十六进制数据转换成RGB颜色alpha可选
 *
 *  @param Color 十六进制颜色值 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha alpha值
 *
 *  @return 返回RGB颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)HexColor alpha:(CGFloat)alpha;

/**
 *  UIColor 转换成 NSString
 *
 *  @param color 颜色值
 *
 *  @return 返回的NSString
 */
+(NSString*)stringFromColor:(UIColor*)color;


/**
 找出图片某一坐标点的颜色
 */
+ (UIColor*)getPixelColorAtLocation:(CGPoint)point inImage:(UIImage*)image;

@end
