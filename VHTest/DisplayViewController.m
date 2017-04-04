//
//  DisplayViewController.m
//  VHTest
//
//  Created by qqvipfunction on 2017/4/4.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "DisplayViewController.h"
#import "VerticalPresentViewController.h"
#import "VerticalPushViewController.h"
#import "LANavigationController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor greenColor];
    v.center = self.view.center;
    v.tag = 1234;
    
    
    //button
    UIButton *pushButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [pushButton1 setTitle:@"presentVertical" forState:UIControlStateNormal];
    [pushButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pushButton1.tag = 2345;
    pushButton1.center = CGPointMake(v.center.x + 125, v.center.y);
    [self.view addSubview:pushButton1];
    [pushButton1 addTarget:self
                    action:@selector(presentVertical)
          forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)presentVertical
{
#if 1
    VerticalPresentViewController *vc = [[VerticalPresentViewController alloc] init];
    UIViewController *nav = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
#endif
    
    
#if 0
    VerticalPushViewController *vc = [[VerticalPushViewController alloc] init];
    UIViewController *nav = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [self.navigationController pushViewController:vc animated:YES];
#endif
    
    
#if 0
    VerticalPresentViewController *vc = [[VerticalPresentViewController alloc] init];
    UIViewController *nav = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [self presentViewController:[[LANavigationController alloc] initWithRootViewController:vc] animated:YES completion:^{
        
    }];
#endif
    
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
    if(self.direction == UIInterfaceOrientationPortrait)
        return UIInterfaceOrientationMaskPortrait;
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return self.direction;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"DisplayViewController viewWillLayoutSubviews");
}
@end
