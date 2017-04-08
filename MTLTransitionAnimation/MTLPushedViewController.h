//
//  MTLTargetViewController.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/8.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTLPushAnimatedTransition.h"

@interface MTLPushedViewController : UIViewController <UINavigationControllerDelegate>

@property (nonatomic, assign) MTLAnimatedTransitionStyle pushStyle;
@property (nonatomic, assign) MTLAnimatedTransitionStyle popStyle;

@end
