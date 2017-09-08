
//
//  UIImageView+Extension.m
//  FangZhou
//
//  Created by wtw on 16/7/19.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

/**
 *  直接设置圆角的图片  使用方法  [self.imageview setHeaderIconWithurl:url:@"xxx.png"]
 *
 *  @param url         图片路径地址
 *  @param palceholder 占位图片名称
 */
-(void)setHeaderIconWithurl:(NSString *)url andPlaceholder:(NSString *)palceholder{

    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage CirecleImage:palceholder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        self.image = [image CirecleImage];
    }];
}

@end
