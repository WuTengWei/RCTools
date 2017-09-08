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
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor getColor:@"666666"]} forState:UIControlStateNormal];
    
    return item;
}


@end
