//
//  MTNativeTransitionAnimator.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//
//  系统过渡动画只适用于Push和Pop

#import "MTBasicTransition.h"

typedef NS_ENUM(NSUInteger, MTNativeTransitionStyle) {
    MTNativeTransitionStyleNone = 0,
    MTNativeTransitionStyleFlipHorizontal,
    MTNativeTransitionStyleCurl,
    MTNativeTransitionStyleCrossDissolve,
    MTNativeTransitionStyleFlipVertical,
};

@interface MTNativeTransition : MTBasicTransition

@property (nonatomic, assign) MTNativeTransitionStyle style;

@end
