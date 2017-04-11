//
//  MTCircleSpreadTransition.h
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/9.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "MTReverseTranstion.h"

@interface MTCircleSpreadTransition : MTReverseTranstion

@property (nonatomic, assign) CGPoint startPoint;//圆圈动画中心点

@property (nonatomic, assign) CGFloat minRadius;//圆圈动画最小半径

@end
