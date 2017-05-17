//
//  UIView+Extension.h
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 jjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/** 获取当前View的控制器对象 */
- (UIViewController *)getCurrentViewController;

/**获取当前视图所在的导航控制器*/
- (UINavigationController*)getCurrentNavController;

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;
@end
