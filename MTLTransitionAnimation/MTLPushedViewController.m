//
//  MTLTargetViewController.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/8.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTLPushedViewController.h"
#import "MTLPushAnimatedTransition.h"

@implementation MTLPushedViewController

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    MTLPushAnimatedTransition *transition = [[MTLPushAnimatedTransition alloc] init];
    //判断控制器是在进行push操作还是pop操作，分别对应不同动画
    transition.animatedTransitionStyle = (operation == UINavigationControllerOperationPush) ? self.pushStyle : self.popStyle;
    
    return transition;
}



@end
