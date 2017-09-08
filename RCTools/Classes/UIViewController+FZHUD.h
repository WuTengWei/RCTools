//
//  UIViewController+FZHUD.h
//  FangZhou
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;
@interface UIViewController (FZHUD)
/**
 *  HUD
 */
@property (nonatomic, strong) MBProgressHUD *hud;

/**
 *  显示Gif动画HUD 默认添加当前View上；
 */
- (void) showHUDGif;

/**
 *  显示带有背景的Gif动画HUD
 */
- (void) showHUDGifWithBackView;

/**
 *  添加在指定View上
 *
 *  @param view UIView
 */
- (void) showHUDGifInView:(UIView *)view;

/**
 *  添加在Window上
 */
- (void) showHUDGifInWindow;

/**
 *  显示文字HUD
 *
 *  @param title 显示的文字
 *  @param delay 延迟隐藏
 */
- (void)showHUDWithTitle:(NSString *)title afterDelay:(NSInteger)delay;

/**
 *  隐藏HUD
 */
- (void)hideHUD;

/**
 *  隐藏HUD：可选动画效果
 *  @param animated  是否带有动画效果
 */
- (void)hideHUDAnimated:(BOOL)animated;


@end
