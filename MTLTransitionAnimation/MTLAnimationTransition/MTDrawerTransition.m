//
//  MTDrawerTransition.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/10.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTDrawerTransition.h"
#import "UIView+XWSnapshot.h"

@interface MTDrawerTransition ()

@property (nonatomic, strong) UIView *fromView;

@end

@implementation MTDrawerTransition

- (void)performAnimateTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC
{
    UIView *containerView = [transitionContext containerView];
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    if (!self.fromView) {
        self.fromView = [[UIView alloc] initWithFrame:initialFrame];
        self.fromView.layer.contents = (__bridge id _Nullable)([fromVC.view snapshot].CGImage);
    } else {
        
    }
    
    UIView *toView = toVC.view;
    toView.frame = CGRectMake(-initialFrame.size.width, 0, initialFrame.size.width, initialFrame.size.height);
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:self.fromView];
    
    [UIView animateWithDuration:self.duration animations:^{
        self.fromView.frame = CGRectMake(self.drawerWidth, 0, initialFrame.size.width, initialFrame.size.height);
        toView.frame = CGRectMake(toView.frame.origin.x + self.drawerWidth, 0, initialFrame.size.width, initialFrame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
