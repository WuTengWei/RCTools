//
//  FZTextField.m
//  FangZhou
//
//  Created by wtw on 16/8/25.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "FZTextField.h"

@implementation FZTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 0);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.hasText) return;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor grayColor];
//    [self.placeholder drawInRect:placehodelRect withAttributes:attrs];
}

@end
