//
//  UIView+XWSnapshot.m
//  MTLTransitionAnimation
//
//  Created by Metallic  on 17/4/10.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "UIView+XWSnapshot.h"

@implementation UIView (XWSnapshot)

- (UIImage *)snapshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

@end
