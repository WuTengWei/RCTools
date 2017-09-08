//
//  UIView+CornerRadius.h
//  CRTest
//
//  Created by long108 on 2016/12/7.
//  Copyright © 2016年 long108. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (CornerRadius)


@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;

@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@end
