//
//  UIViewController+FZNavigationBar.h
//  FangZhou
//
//  Created by Aaron on 16/7/21.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FZNavigationBar)
/**
 *  设置导航栏前景颜色
 *
 *  @param color 颜色
 */
- (void)setNavigationBarTintColor:(UIColor *)color;

/**
 *  设置导航栏背景隐藏
 *
 *  @param hidden 是否隐藏
 */
- (void)setNavigationBarBgViewHidden:(BOOL)hidden;
    
@end
