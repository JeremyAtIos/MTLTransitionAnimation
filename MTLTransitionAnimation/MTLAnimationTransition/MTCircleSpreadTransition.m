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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _startPoint = CGPointMake(64, 64);
        _minRadius = 5.0;
    }
    return self;
}

- (void)setStartPoint:(CGPoint)startPoint
{
    _startPoint = startPoint.x < 0 || startPoint.y < 0 ? CGPointMake(64, 64) : startPoint;
}

- (void)setMinRadius:(CGFloat)minRadius
{
    _minRadius = minRadius < 0 ? 5.0 : minRadius;
}

- (void)performPositiveTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                    fromViewController:(UIViewController *)fromVC
                                      toViewController:(UIViewController *)toVC
{
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    UIBezierPath *startCirclePath = [self createCirclePathWithContainerView:containerView isCover:NO];
    
    UIBezierPath *endCirclePath = [self createCirclePathWithContainerView:containerView isCover:YES];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCirclePath.CGPath;
    
    toVC.view.layer.mask = maskLayer;
    [self executePathAnimationWithTransitionContext:transitionContext
                                           FromPath:startCirclePath
                                             toPath:endCirclePath
                                            atLayer:maskLayer];
}

- (void)performReverseTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];
    
    UIBezierPath *startCirclePath = [self createCirclePathWithContainerView:containerView isCover:YES];
    
    UIBezierPath *endCirclePath = [self createCirclePathWithContainerView:containerView isCover:NO];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCirclePath.CGPath;
    
    fromVC.view.layer.mask = maskLayer;
    [self executePathAnimationWithTransitionContext:transitionContext
                                           FromPath:startCirclePath
                                             toPath:endCirclePath
                                            atLayer:maskLayer];
}


//动画部分
- (void)executePathAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                         FromPath:(UIBezierPath *)fromPath
                                           toPath:(UIBezierPath *)toPath
                                          atLayer:(CAShapeLayer *)maskLayer

{
    CABasicAnimation *circleSpreadAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleSpreadAnimation.fromValue = (__bridge id _Nullable)(fromPath.CGPath);
    circleSpreadAnimation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    circleSpreadAnimation.duration = self.duration;
    circleSpreadAnimation.delegate = self;
    [circleSpreadAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:circleSpreadAnimation forKey:@"Circle Spread"];
}

//动画路径
- (UIBezierPath *)createCirclePathWithContainerView:(UIView *)containerView
                                            isCover:(BOOL)isCover
{
    if (isCover) {
        CGFloat x = self.startPoint.x;
        CGFloat y = self.startPoint.y;
        CGFloat maxX = MAX(x, containerView.bounds.size.width - x);
        CGFloat maxY = MAX(y, containerView.bounds.size.height - y);
        CGFloat maxRadius = sqrt(pow(maxX, 2) + pow(maxY, 2));
        return [UIBezierPath bezierPathWithArcCenter:self.startPoint radius:maxRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    } else {
        return [UIBezierPath bezierPathWithArcCenter:self.startPoint radius:self.minRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    }
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}






@end
