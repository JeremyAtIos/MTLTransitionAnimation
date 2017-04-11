//
//  MTReverseTranstion.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/11.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTBasicTransition.h"

@interface MTReverseTranstion : MTBasicTransition

- (void)performPositiveTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                    fromViewController:(UIViewController *)fromVC
                                      toViewController:(UIViewController *)toVC;

- (void)performReverseTranstionWithTransitoionContext:(id<UIViewControllerContextTransitioning>)transitionContext
                                   fromViewController:(UIViewController *)fromVC
                                     toViewController:(UIViewController *)toVC;

@end
