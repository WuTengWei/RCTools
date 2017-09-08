//
//  UICollectionView+FZCategory.h
//  FangZhou
//
//  Created by wtw on 2017/5/26.
//  Copyright © 2017年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (FZCategory)

/**
 *  注册cell ,identifier 为类名
 *
 *  @param classes 需要注册的类
 */
- (void)registerNibsWithClasses:(NSArray *)classes;

/**
 *  注册cell 有xib为注册同名Nib; 无xib为注册class, identifier 为类名
 *
 *  @param classes 需要注册的类
 */
- (void)registerCellsWithClasses:(NSArray *)classes;

@end
