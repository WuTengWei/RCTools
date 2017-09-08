//
//  UIViewController+FZHUD.m
//  FangZhou
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 rocedar. All rights reserved.
//

#import "UIViewController+FZHUD.h"
#import <UIImage+GIF.h>
#import "MBProgressHUD.h"
#import <objc/runtime.h>
#import <AFNetworkActivityIndicatorManager.h>
#import "FLAnimatedImage.h"


NSString * const kHudPropertyKey = @"kViewControllerHud";

@implementation UIViewController (FZHUD)

- (void) setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, (__bridge const void *)(kHudPropertyKey), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, (__bridge const void *)(kHudPropertyKey));
}


- (void) showHUDGif {
    
    [self showHUDGifWithBackView:NO withView:nil];
}

- (void) showHUDGifWithBackView {
    [self showHUDGifWithBackView:YES withView:nil];
}

- (void) showHUDGifInView:(UIView *)view {
    [self showHUDGifWithBackView:NO withView:view];
}


- (void) showHUDGifInWindow {
    [self showHUDGifWithBackView:NO withView:[UIApplication sharedApplication].keyWindow];
}



- (void)showHUDGifWithBackView:(BOOL)hidden withView:(UIView *)inView {
    
    UIView *view;
    if (inView) {
        view = inView;
    } else {
        if (self.view.superview) {
            view = self.view.superview;
        } else {
            view = self.view;
        }

    }
    
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc] initWithView:view];
    }
    
    if (hidden) {
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    } else {
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    self.hud.bezelView.color = [UIColor clearColor];
    
    self.hud.mode = MBProgressHUDModeCustomView;
    [self.hud setRemoveFromSuperViewOnHide:YES];
    
//    if (inView) {
//        self.hud.backgroundView = nil;
//    }
    
    NSString  *name = @"tiaozhuanjiazai.gif";
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:nil];
    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 10, 10);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
    self.hud.customView = imageView;
    
    [view addSubview:self.hud];
    [self.hud showAnimated:YES];
    
}

- (void)showHUDWithTitle:(NSString *)title afterDelay:(NSInteger)delay {
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    }
    self.hud.mode = MBProgressHUDModeText;
    [self.hud setRemoveFromSuperViewOnHide:YES];
    self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.label.text = title;
    [self.view addSubview:self.hud];
    [self.hud showAnimated:YES];

    [self.hud hideAnimated:YES afterDelay:delay];
}

- (void)hideHUD {
    [self hideHUDAnimated:YES];
}

- (void)hideHUDAnimated:(BOOL)animated {
    if(self.hud) {
        [self.hud hideAnimated:animated];
        self.hud = nil;
    }
}


@end
