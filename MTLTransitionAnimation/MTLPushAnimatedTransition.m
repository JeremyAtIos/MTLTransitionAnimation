//
//  MTLAnimatedTransition.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/8.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTLPushAnimatedTransition.h"

@implementation MTLPushAnimatedTransition

- (instancetype)init
{
    self = [super init];
    if (self) {
        //写入一些默认配置
        _animatedDuration = 1.0;
        _animatedTransitionStyle = MTLAnimatedTransitionStyleNone;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.animatedDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //1.从转场上下文中取出参与转场的控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //2.从转场上下文中取出转场动画发生的容器视图，并添加参与动画的子视图
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];
    
    //3.动画
    switch (_animatedTransitionStyle) {
        //系统自带过渡动画
        case MTLAnimatedTransitionStyleNone:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionNone];
            break;
            
        case MTLAnimatedTransitionStyleFlipFromLeft:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionFlipFromLeft];
            break;

        case MTLAnimatedTransitionStyleFlipFromRight:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionFlipFromRight];
            break;

        case MTLAnimatedTransitionStyleCurlUp:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionCurlUp];
            break;
            
        case MTLAnimatedTransitionStyleCurlDown:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionCurlDown];
            break;
            
        case MTLAnimatedTransitionStyleCrossDissolve:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionCrossDissolve];
            break;

        case MTLAnimatedTransitionStyleFlipFromTop:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionFlipFromTop];
            break;
            
        case MTLAnimatedTransitionStyleFlipFromBottom:
            [self performNativeTransitionStyleWithFromView:fromVC.view
                                                    toView:toVC.view
                                         transitionContext:transitionContext
                                           animationOption:UIViewAnimationOptionTransitionFlipFromBottom];
            break;
        //自定义过渡动画
    }
}

- (void)performNativeTransitionStyleWithFromView:(UIView *)fromView
                                          toView:(UIView *)toView
                               transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                 animationOption:(UIViewAnimationOptions)animationOption
{
    [UIView transitionFromView:fromView toView:toView duration:[self transitionDuration:transitionContext] options:animationOption completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
