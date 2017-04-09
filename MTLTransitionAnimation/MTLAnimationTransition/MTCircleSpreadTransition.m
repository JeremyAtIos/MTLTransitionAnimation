//
//  MTCircleSpreadTransition.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTCircleSpreadTransition.h"

@interface MTCircleSpreadTransition () <CAAnimationDelegate>

@end

@implementation MTCircleSpreadTransition

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    CGPoint startPoint = CGPointMake(100, 100);
    
    //动画的初始路径
    UIBezierPath *startCirclePath = [UIBezierPath bezierPathWithArcCenter:startPoint radius:1.0 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    //求出动画结束路径的半径
    CGFloat x = startPoint.x;
    CGFloat y = startPoint.y;
    CGFloat endX = MAX(x, containerView.bounds.size.width - x);
    CGFloat endY = MAX(y, containerView.bounds.size.height - y);
    CGFloat endRadius = sqrt(pow(endX, 2) + pow(endY, 2));
    
    //动画的结束路径
    UIBezierPath *endCirclePath = [UIBezierPath bezierPathWithArcCenter:startPoint radius:endRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    //设置目的视图的蒙版
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCirclePath.CGPath;//传入结束路径，因为动画完成后会被移除
    toVC.view.layer.mask = maskLayer;
    
    //基础动画
    CABasicAnimation *circleSpreadAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleSpreadAnimation.fromValue = (__bridge id)startCirclePath.CGPath;
    circleSpreadAnimation.toValue = (__bridge id)endCirclePath.CGPath;
    circleSpreadAnimation.duration = self.duration;
    circleSpreadAnimation.delegate = self;
    [circleSpreadAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:circleSpreadAnimation forKey:@"Circel Spread"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}






@end
