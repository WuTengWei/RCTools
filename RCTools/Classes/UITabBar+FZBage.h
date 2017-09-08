//
//  UITabBar+FZBage.h
//  FangZhou
//
//  Created by long108 on 2017/6/6.
//  Copyright © 2017年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (FZBage)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
