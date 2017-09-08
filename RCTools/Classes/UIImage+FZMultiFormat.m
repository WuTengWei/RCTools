//
//  UIImage+FZMultiFormat.m
//  FangZhou
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIImage+MultiFormat.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>
#import "NSData+ImageContentType.h"
#import "UIImage+GIF.h"


@implementation UIImage (FZMultiFormat)

+ (void)load {
    Method originalMethod = class_getClassMethod([self class], @selector(sd_imageWithData:));
    Method swizzledMethod = class_getClassMethod([self class], @selector(fzsd_imageWithData:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (UIImage *)fzsd_imageWithData:(NSData *)data {
    
    if (!data) {
        return nil;
    }
    
    UIImage *image;
//    NSString *imageContentType = [NSData sd_contentTypeForImageData:data];
//    if ([imageContentType isEqualToString:@"image/gif"]) {

    SDImageFormat sdfm = [NSData sd_imageFormatForImageData:data];
    if (sdfm == SDImageFormatGIF) {
        image = [UIImage sd_animatedGIFWithData:data];
    }
#ifdef SD_WEBP
    else if ([imageContentType isEqualToString:@"image/webp"])
    {
        image = [UIImage sd_imageWithWebPData:data];
    }
#endif
    else {
        image = [[UIImage alloc] initWithData:data];
        
        if (data.length/1024 > 10) {
            image = [self compressImageWith:image];
        }
        
        SEL selector = NSSelectorFromString(@"sd_imageOrientationFromImageData:");
        IMP imp = [self methodForSelector:selector];
        UIImageOrientation (*func)(id, SEL, NSData *) = (void *)imp;
        
        
        UIImageOrientation orientation = func(self, selector,data);
        if (orientation != UIImageOrientationUp) {
            image = [UIImage imageWithCGImage:image.CGImage
                                        scale:image.scale
                                  orientation:orientation];
        }
    }
    
    return image;
}

+ (UIImage *)compressImageWith:(UIImage *)image
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    
    float width = 1080;
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}



@end
