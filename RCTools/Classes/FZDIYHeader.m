//
//  FZDIYHeader.m
//  FangZhou
//
//  Created by wtw on 2017/7/7.
//  Copyright © 2017年 rocedar. All rights reserved.
//

#import "FZDIYHeader.h"

@interface FZDIYHeader ()

@property (weak, nonatomic) UIImageView *logo;

@end

@implementation FZDIYHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageWithColor:[UIColor getColor:FZBASIC_COLOR]]];
//    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
    
    self.mj_h = 250;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.bounds = self.bounds;
    self.logo.frame = CGRectMake(0, 0, KSCREEN_WIDTH, self.mj_h);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            break;
        case MJRefreshStatePulling:
            break;
        case MJRefreshStateRefreshing:
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}


@end
