//
//  MTReverseTranstion.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/11.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTReverseTranstion.h"

@interface MTReverseTranstion ()

@property (nonatomic, assign) BOOL isPositive;

@end

@implementation MTReverseTranstion

- (BOOL)isPositive
{
    if (self.transitionOperation == MTTransitionOperationPush ||
        self.transitionOperation == MTTransitionOperationPresent) {
        return YES;
    } else {
        return NO;
    }
}

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{
    if (self.isPositive) {
        //执行正向过渡动画
        [self performPositiveTranstionWithTransitoionContext:transitionContext fromViewController:fromVC toViewController:toVC];
    } else {
        //执行反向过渡动画
        [self performReverseTranstionWithTransitoionContext:transitionContext fromViewController:fromVC toViewController:toVC];
    }
}

- (void)performPositiveTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{}

- (void)performReverseTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{}

@end
