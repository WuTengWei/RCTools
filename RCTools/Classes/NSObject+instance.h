//
//  NSObject+instance.h
//  FangZhou
//
//  Created by wtw on 16/11/4.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (instance)
+ (instancetype)instance;
@end

@interface UIView (instace)
+ (instancetype)instance:(CGRect)frame;
@end
