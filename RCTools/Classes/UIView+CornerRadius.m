//
//  UIView+CornerRadius.m
//  CRTest
//
//  Created by long108 on 2016/12/7.
//  Copyright © 2016年 long108. All rights reserved.
//

#import "UIView+CornerRadius.h"
IB_DESIGNABLE
@implementation UIView (CornerRadius)
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    return self.borderColor;
}
@end
