//
//  MTTransitionAnimator.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTBasicTransition.h"

@implementation MTBasicTransition

+ (instancetype)transition
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _duration = 1.0;
        _transitionOperation = MTTransitionOperationPush;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [self performAnimateTranstionWithTransitoionContext:transitionContext
                                     fromViewController:fromVC
                                       toViewController:toVC];
}

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{}

@end
