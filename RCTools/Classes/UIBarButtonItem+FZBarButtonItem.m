//
//  UIBarButtonItem+FZBarButtonItem.m
//  FangZhou
//
//  Created by wtw on 16/12/26.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "UIBarButtonItem+FZBarButtonItem.h"

@implementation UIBarButtonItem (FZBarButtonItem)

+ (instancetype)itemWithtitle:(NSString *)title target:(id)target action:(SEL)action {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[self getColor:@"666666"]} forState:UIControlStateNormal];
    
    return item;
}

+ (UIColor *) getColor: (NSString *)hexColro {
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColro substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColro substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColro substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}
@end
