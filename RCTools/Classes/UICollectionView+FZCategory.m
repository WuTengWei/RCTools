//
//  UICollectionView+FZCategory.m
//  FangZhou
//
//  Created by wtw on 2017/5/26.
//  Copyright © 2017年 rocedar. All rights reserved.
//

#import "UICollectionView+FZCategory.h"

@implementation UICollectionView (FZCategory)

- (void)registerNibsWithClasses:(NSArray *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass([aClass class]);
        UINib *nib = [UINib nibWithNibName:className bundle:nil];
        
        [self registerNib:nib forCellWithReuseIdentifier:className];
    }
}

- (void)registerCellsWithClasses:(NSArray *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass(aClass);
        
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        if (nibPath) {
            UINib *nib = [UINib nibWithNibName:className bundle:nil];
            [self registerNib:nib forCellWithReuseIdentifier:className];
        } else {
            [self registerClass:aClass forCellWithReuseIdentifier:className];
        }
    }
}

@end
