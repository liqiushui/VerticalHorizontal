//
//  VerticalPresentViewController.m
//  VHTest
//
//  Created by qqvipfunction on 2017/4/4.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "VerticalPresentViewController.h"

@interface VerticalPresentViewController ()

@end

@implementation VerticalPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor greenColor];
    v.center = self.view.center;
    v.tag = 1234;
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = 2345;
    button.center = CGPointMake(v.center.x , v.center.y);
    [self.view addSubview:button];
    [button addTarget:self
                    action:@selector(dismiss)
          forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    UIView *v = [self.view viewWithTag:1234];
    v.center = self.view.center;
    [self.view viewWithTag:2345].center = CGPointMake(v.center.x, v.center.y);
    
    [self setOrientation:UIInterfaceOrientationPortrait];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)setOrientation:(UIInterfaceOrientation)direction
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = direction;//横屏
        
        [invocation setArgument:&val atIndex:2];
        
        [invocation invoke];
        
    }
    else
    {
        NSLog(@"setOrientation Method not support!!!");
    }
}


@end
