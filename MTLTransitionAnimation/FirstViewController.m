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

@interface FirstViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
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

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    MTCircleSpreadTransition *transition = [[MTCircleSpreadTransition alloc] init];
    transition.duration = 0.5;
    
    return transition;
}

@end
