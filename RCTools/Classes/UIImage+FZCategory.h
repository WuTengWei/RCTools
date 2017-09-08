//
//  UIImage+Scale.h
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FZCategory)

/**
 *  把图片缩小到指定尺寸
 *
 *  @param imageSize 制定图片的尺寸
 *
 *  @return 新的图片
 */
- (UIImage *)scaleImageToSize:(CGSize)imageSize;


/**
 *  把图片缩小到宽或高最大得长度
 *
 *  @param imageWdithOrHeight 图片的宽或高
 *
 *  @return 新图片
 */
- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight;



+ (UIImage *)imageWithColor:(UIColor *)color;

/** 文字添加到图片上 */
+ (UIImage *)image:(UIImage *)image text:(NSString *)text;

/**
 *  对图片进行圆角处理
 *
 *  @param image 图片
 *  @param size  大小
 */
+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size;

/**
 *  返回裁剪后的圆形图片  [image CirecleImage]
 *
 *  @return 返回裁剪后的圆形图片
 */
- (instancetype)CirecleImage;

/**
 *  传入图片名返回剪切后的图片   [UIIamge CirecleImage:@“XXX.png”]
 *
 *  @param name 图片名册
 *
 *  @return 返回剪切后的图片
 */
+ (instancetype)CirecleImage:(NSString *)name;

/* 使用方式
 [self.imageview sd_setImageWithURL:[NSURL URLWithString:topic.profile_image ] placeholderImage:[UIImage CircleImage:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         if (image == nil) return ;
         self.imageview.image =  [image CircleImage];
     }];

 */


/**
 *  等比压缩图片
 *
 *  @param image 传入图片
 *
 *  @return 返回图片
 */
- (UIImage *)compressImage;

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
- (UIImage *)imageWithColor:(UIColor *)color;
@end
