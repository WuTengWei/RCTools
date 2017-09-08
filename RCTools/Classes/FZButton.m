//
//  FZButton.m
//  FangZhou
//
//  Created by wtw on 16/9/5.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "FZButton.h"

@implementation FZButton

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = 0;
    self.titleLabel.frame = titleFrame;
    
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.x = self.titleLabel.bounds.size.width + 2;
    self.imageView.frame = imageFrame;
}

@end
