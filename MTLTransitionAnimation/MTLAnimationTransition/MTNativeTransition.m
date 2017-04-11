//
//  MTNativeTransitionAnimator.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTNativeTransition.h"

@implementation MTNativeTransition

- (instancetype)initWithTransitionDuration:(NSTimeInterval)duration
                                 operation:(MTTransitionOperation)operation
{
    self = [super initWithTransitionDuration:duration operation:operation];
    if (self) {
        _style = MTNativeTransitionStyleFlipHorizontal;
    }
    return self;
}

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{
    if (self.transitionOperation == MTTransitionOperationPush ||
        self.transitionOperation == MTTransitionOperationPop) {
        UIView *containerView = [transitionContext containerView];
        UIView *fromView = fromVC.view;
        UIView *toView = toVC.view;
        
        [containerView addSubview:toView];
        
        //根据动画选项得到系统过渡动画类型
        UIViewAnimationOptions nativeOption;
        switch (self.style) {
            case MTNativeTransitionStyleNone:
                nativeOption = UIViewAnimationOptionTransitionNone;
                break;
                
            case MTNativeTransitionStyleFlipHorizontal:
                nativeOption = self.transitionOperation == MTTransitionOperationPush ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
                break;
                
            case MTNativeTransitionStyleCurl:
                nativeOption = self.transitionOperation == MTTransitionOperationPush ? UIViewAnimationOptionTransitionCurlUp : UIViewAnimationOptionTransitionCurlDown;
                break;
                
            case MTNativeTransitionStyleCrossDissolve:
                nativeOption = UIViewAnimationOptionTransitionCrossDissolve;
                break;
                
            case MTNativeTransitionStyleFlipVertical:
                nativeOption = self.transitionOperation == MTTransitionOperationPush ? UIViewAnimationOptionTransitionFlipFromTop : UIViewAnimationOptionTransitionFlipFromBottom;
        }
        
        [UIView transitionFromView:fromView toView:toView duration:self.duration
                           options:nativeOption completion:^(BOOL finished) {
                               [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                           }];

    } else {
        @throw [NSException exceptionWithName:@"Transition Exception"
                                       reason:@"Only use for Push or Pop"
                                     userInfo:nil];
    }
}

@end
