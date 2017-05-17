//
//  NSObject+instance.m
//  FangZhou
//
//  Created by wtw on 16/11/4.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "NSObject+instance.h"

@implementation NSObject (instance)
+ (instancetype)instance
{
    return [[[self class] alloc] init];
}
@end

@implementation UIView(instance)
+ (instancetype)instance:(CGRect)frame;
{
    return [[[self class] alloc] initWithFrame:frame];
}
@end
