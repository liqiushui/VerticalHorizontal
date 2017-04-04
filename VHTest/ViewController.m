//
//  ViewController.m
//  VHTest
//
//  Created by qqvipfunction on 2017/4/4.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "ViewController.h"
#import "DisplayViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor greenColor];
    v.center = self.view.center;
    v.tag = 1234;
    
    //button
    UIButton *pushButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [pushButton1 setTitle:@"pushVertical" forState:UIControlStateNormal];
    [pushButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pushButton1.tag = 2345;
    pushButton1.center = CGPointMake(v.center.x + 125, v.center.y);
    [self.view addSubview:pushButton1];
    [pushButton1 addTarget:self
                    action:@selector(pushVertical)
          forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *pushButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [pushButton2 setTitle:@"pushHorizontal" forState:UIControlStateNormal];
    [pushButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pushButton2.tag = 3456;
    pushButton2.center = CGPointMake(v.center.x - 125, v.center.y);
    [self.view addSubview:pushButton2];
    [pushButton2 addTarget:self
                    action:@selector(pushHorizontal)
          forControlEvents:UIControlEventTouchUpInside];
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


- (void)pushVertical
{
    DisplayViewController *vc = [[DisplayViewController alloc] init];
    vc.direction = UIInterfaceOrientationPortrait;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushHorizontal
{
    [self setOrientation:UIInterfaceOrientationLandscapeRight];

    DisplayViewController *vc = [[DisplayViewController alloc] init];
    vc.direction = UIInterfaceOrientationLandscapeRight;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    UIView *v = [self.view viewWithTag:1234];
    v.center = self.view.center;
    [self.view viewWithTag:2345].center = CGPointMake(v.center.x + 125, v.center.y);
    [self.view viewWithTag:3456].center = CGPointMake(v.center.x - 125, v.center.y);

}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}
@end
