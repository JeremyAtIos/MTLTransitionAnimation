//
//  MTLAnimatedTransition.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/8.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTLAnimatedTransitionStyle) {
    MTLAnimatedTransitionStyleNone = 0,
    MTLAnimatedTransitionStyleFlipFromLeft,
    MTLAnimatedTransitionStyleFlipFromRight,
    MTLAnimatedTransitionStyleCurlUp,
    MTLAnimatedTransitionStyleCurlDown,
    MTLAnimatedTransitionStyleCrossDissolve,
    MTLAnimatedTransitionStyleFlipFromTop,
    MTLAnimatedTransitionStyleFlipFromBottom
};

@interface MTLPushAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval animatedDuration;//转场动画持续时间

@property (nonatomic, assign) MTLAnimatedTransitionStyle animatedTransitionStyle;//转场动画风格

@end
