//
//  UIBarButtonItem+FZBarButtonItem.h
//  FangZhou
//
//  Created by wtw on 16/12/26.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FZBarButtonItem)
+ (instancetype)itemWithtitle:(NSString *)title target:(id)target action:(SEL)action;
@end
