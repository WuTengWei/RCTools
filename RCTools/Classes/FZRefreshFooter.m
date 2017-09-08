//
//  FZRefreshFooter.m
//  FangZhou
//
//  Created by wtw on 16/7/25.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "FZRefreshFooter.h"

@implementation FZRefreshFooter

- (void)prepare {

    [super prepare];
    
    self.stateLabel.font = [UIFont systemFontOfSize:15];
    [self setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"正在努力加载中" forState:MJRefreshStatePulling];
    [self setTitle:@"已经是最后一页了~" forState:MJRefreshStateNoMoreData];
}

@end
