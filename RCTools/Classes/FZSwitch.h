//
//  FZSwitch.h
//  FangZhou
//
//  Created by wtw on 2017/7/8.
//  Copyright © 2017年 rocedar. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Switch type
typedef enum {
    FZSwitchStyleLight,
    FZSwitchStyleDark,
    FZSwitchStyleDefault
} FZSwitchStyle;

#pragma mark - Initial state (on or off)
typedef enum {
    FZSwitchStateOn,
    FZSwitchStateOff
} FZSwitchState;

#pragma mark - Initial FZSwitch size (big, normal, small)
typedef enum {
    FZSwitchSizeBig,
    FZSwitchSizeNormal,
    FZSwitchSizeSmall
} FZSwitchSize;

@protocol FZSwitchDelegate <NSObject>
// Delegate method
- (void)switchStateChanged:(FZSwitchState)currentState;
@end

@interface FZSwitch : UIControl

#pragma mark - Properties
#pragma Delegate
@property (nonatomic, assign) id<FZSwitchDelegate> delegate;

#pragma State
/** A Boolean value that represents switch's current state(ON/OFF). YES to ON, NO to OFF the switch */
@property (nonatomic) BOOL isOn;
/** A Boolean value that represents switch's interaction mode. YES to set enabled, No to set disabled*/
@property (nonatomic) BOOL isEnabled;
/** A Boolean value whether the bounce animation effect is enabled when state change movement */
@property (nonatomic) BOOL isBounceEnabled;
/** A Boolean value whether the ripple animation effect is enabled or not */
@property (nonatomic) BOOL isRippleEnabled;

#pragma Colour
/** An UIColor property to represent the colour of the switch thumb when position is ON */
@property (nonatomic, strong) UIColor *thumbOnTintColor;
/** An UIColor property to represent the colour of the switch thumb when position is OFF */
@property (nonatomic, strong) UIColor *thumbOffTintColor;
/** An UIColor property to represent the colour of the track when position is ON */
@property (nonatomic, strong) UIColor *trackOnTintColor;
/** An UIColor property to represent the colour of the track when position is OFF */
@property (nonatomic, strong) UIColor *trackOffTintColor;
/** An UIColor property to represent the colour of the switch thumb when position is DISABLED */
@property (nonatomic, strong) UIColor *thumbDisabledTintColor;
/** An UIColor property to represent the colour of the track when position is DISABLED */
@property (nonatomic, strong) UIColor *trackDisabledTintColor;
/** An UIColor property to represent the fill colour of the ripple only when ripple effect is enabled */
@property (nonatomic, strong) UIColor *rippleFillColor;

#pragma UI components
/** An UIButton object that represents current state(ON/OFF) */
@property (nonatomic, strong) UIButton *switchThumb;
/** An UIView object that represents the track for the thumb */
@property (nonatomic, strong) UIView *track;

#pragma mark - Initializer
/**
 *  Initializes a FZSwitch in the easiest way with default parameters.
 *
 *  @FZSwitchStyle: FZSwitchStyleDefault,
 *  @FZSwitchState: FZSwitchStateOn,
 *  @FZSwitchSize: FZSwitchSizeNormal
 *
 *  @return A JTFadingInfoView with above parameters
 */
- (id)init;

/**
 *  Initializes a FZSwitch with a initial switch state position and size.
 *
 *  @param size A FZSwitchSize enum as this view's size(big, normal, small)
 *  @param state A FZSwitchState enum as this view's initial switch pos(ON/OFF)
 *
 *  @return A JTFadingInfoView with size and initial position
 */
- (id)initWithSize:(FZSwitchSize)size state:(FZSwitchState)state;

/**
 *  Initializes a FZSwitch with a initial switch size, style and state.
 *
 *  @param size A FZSwitchSize enum as this view's size(big, normal, small)
 *  @param state A FZSwitchStyle enum as this view's initial style
 *  @param state A FZSwitchState enum as this view's initial switch pos(ON/OFF)
 *
 *  @return A JTFadingInfoView with size, style and initial position
 */
- (id)initWithSize:(FZSwitchSize)size style:(FZSwitchStyle)style state:(FZSwitchState)state;

#pragma setter/getter
/**
 *  Initializes a FZSwitch with a initial switch size, style and state.
 *
 *  @return A boolean value. Yes if the current switch state is ON, NO if OFF.
 */
- (BOOL)getSwitchState;

/**
 *  Set switch state with or without moving animation of switch thumb
 *
 *  @param on The switch state you want to set
 *  @param animated Yes to set with animation, NO to do without.
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated;


@end
