//
//  FirstViewController.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MTNativeTransition.h"
#import "MTCircleSpreadTransition.h"
#import "MTDrawerTransition.h"

@interface FirstViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, assign) CGPoint touchPoint;

@property (nonatomic, strong) MTCircleSpreadTransition *transition;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
}

- (IBAction)dismissButtonClicked:(UIStoryboardSegue *)segue
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Present Animation"]) {
        SecondViewController *secondVC = (SecondViewController *)segue.destinationViewController;
        secondVC.transitioningDelegate = self;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.transitionOperation = MTTransitionOperationPresent;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.transitionOperation = MTTransitionOperationDismiss;
    return self.transition;
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    self.transition.transitionOperation = operation == UINavigationControllerOperationPush ? MTTransitionOperationPush : MTTransitionOperationPop;
    return _transition;
}

- (MTCircleSpreadTransition *)transition
{
    if (!_transition) {
        _transition = [MTCircleSpreadTransition transition];
//        _transition.startPoint = CGPointMake(200, 300);
    }
    return _transition;
}


@end
