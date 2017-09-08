//
//  UIImage+Scale.m
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import "UIImage+FZCategory.h"

@implementation UIImage (HYCategory)

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw,fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace,kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 5, 5);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}


- (UIImage *)scaleImageToSize:(CGSize)imageSize {
    UIGraphicsBeginImageContext(imageSize);
    
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight {
    CGSize size = self.size;
    UIImage *newImage;
    if (size.width > size.height) {
        if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }else if (size.width <= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
//        else if (size.height >= imageWdithOrHeight) {
//            float scale = imageWdithOrHeight / size.height;
//            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
//            newImage = [self scaleImageToSize:newSize];
//        }
        else {
            newImage = self;
        }
    }
    else {
        if (size.width <= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else {
            newImage = self;
        }
    }
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


//文字绘制到图片上
+ (UIImage *)image:(UIImage *)image text:(NSString *)text
{
    CGSize size = CGSizeMake(image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    [image drawAtPoint:CGPointMake(0, 0)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawPath(context, kCGPathStroke);
    
    [text drawAtPoint:CGPointMake(image.size.width * 0.6, image.size.height * 0.479) withAttributes:@{ NSFontAttributeName :[ UIFont systemFontOfSize:23 ],NSForegroundColorAttributeName :[ UIColor blackColor] }];
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
}

- (instancetype)CirecleImage {

    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect =  CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextClip(ctx);
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)CirecleImage:(NSString *)name {
    
    return [[self imageNamed:name] CirecleImage];
}

/**
 *  等比压缩图片
 *
 *  @param image 传入图片
 *
 *  @return 返回图片
 */
- (UIImage *)compressImage
{
    float imageWidth = self.size.width;
    float imageHeight = self.size.height;
    
    float width = 1080;
    float height = self.size.height / (self.size.width / width);
    
    float widthScale = imageWidth / width;
    float heightScale = imageHeight / height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [self drawInRect:CGRectMake(0, 0, imageWidth / heightScale , height)];
    }
    else {
        [self drawInRect:CGRectMake(0, 0, width , imageHeight / widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
- (UIImage *)imageWithColor:(UIColor *)color {
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
