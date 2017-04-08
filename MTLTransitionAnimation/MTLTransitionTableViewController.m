//
//  MTLTransitionTableViewController.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/8.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTLTransitionTableViewController.h"
#import "MTLPushedViewController.h"

@interface MTLTransitionTableViewController ()

@end

@implementation MTLTransitionTableViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MTLPushedViewController class]]) {
        MTLPushedViewController *pushedVC = (MTLPushedViewController *)segue.destinationViewController;
        self.navigationController.delegate = pushedVC;
        
        if ([segue.identifier isEqualToString:@"Push Left Right Flip"]) {
            //左右翻转
            pushedVC.pushStyle = MTLAnimatedTransitionStyleFlipFromLeft;
            pushedVC.popStyle = MTLAnimatedTransitionStyleFlipFromRight;
        } else if ([segue.identifier isEqualToString:@"Push Top Bottom Flip"]) {
            //上下翻转
            pushedVC.pushStyle = MTLAnimatedTransitionStyleFlipFromTop;
            pushedVC.popStyle = MTLAnimatedTransitionStyleFlipFromBottom;
        } else if ([segue.identifier isEqualToString:@"Push Fade"]) {
            //渐隐渐现
            pushedVC.pushStyle = MTLAnimatedTransitionStyleCrossDissolve;
            pushedVC.popStyle = MTLAnimatedTransitionStyleCrossDissolve;
        } else if ([segue.identifier isEqualToString:@"Push Up Down Curl"]) {
            //上下翻页
            pushedVC.pushStyle = MTLAnimatedTransitionStyleCurlUp;
            pushedVC.popStyle = MTLAnimatedTransitionStyleCurlDown;
        }
    }
}

@end
