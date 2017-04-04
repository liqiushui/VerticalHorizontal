//
//  LANavigationController.m
//  LiveAssistant
//
//  Created by qqvipfunction on 16/12/6.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "LANavigationController.h"

@interface LANavigationController ()

@end

@implementation LANavigationController

//支持旋转
-(BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}


@end
