//
//  UIViewController+FZNavigationBar.m
//  FangZhou
//
//  Created by Aaron on 16/7/21.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "UIViewController+FZNavigationBar.h"

@implementation UIViewController (FZNavigationBar)

- (void)setNavigationBarTintColor:(UIColor *)color {
    [UIApplication sharedApplication].statusBarHidden = NO;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = color;
    self.navigationController.navigationBar.titleTextAttributes = attrs;
    self.navigationController.navigationBar.tintColor = color;
}

- (void)setNavigationBarBgViewHidden:(BOOL)hidden {

    if (hidden) {
        self.navigationController.navigationBar.translucent = YES;
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    } else {
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = nil;
        self.navigationController.navigationBar.alpha = 1.0f;
    }
}
@end
