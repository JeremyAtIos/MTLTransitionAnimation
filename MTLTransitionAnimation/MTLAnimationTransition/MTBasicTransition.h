//
//  MTTransitionAnimator.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTTransitionOperation) { //控制器跳转方式
    MTTransitionOperationPush = 0,
    MTTransitionOperationPop,
    MTTransitionOperationPresent,
    MTTransitionOperationDismiss
};

@interface MTBasicTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) NSTimeInterval duration;

@property (nonatomic, assign, readonly) MTTransitionOperation transitionOperation;

- (instancetype)initWithTransitionDuration:(NSTimeInterval)duration
                                 operation:(MTTransitionOperation)operation;

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC;

@end
