//
//  MTTransitionAnimator.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTBasicTransition.h"

@interface MTBasicTransition ()

@property (nonatomic, assign, readwrite) NSTimeInterval duration;

@property (nonatomic, assign, readwrite) MTTransitionOperation transitionOperation;

@end

@implementation MTBasicTransition

- (instancetype)initWithTransitionDuration:(NSTimeInterval)duration
                                 operation:(MTTransitionOperation)operation
{
    self = [super init];
    if (self) {
        _duration = duration;
        _transitionOperation = operation;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithTransitionDuration:1.0 operation:MTTransitionOperationPush];
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
