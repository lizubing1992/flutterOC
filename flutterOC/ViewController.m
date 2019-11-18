//
//  ViewController.m
//  flutterOC
//
//  Created by nongfadai on 2019/5/15.
//  Copyright © 2019 nongfadai. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "MyFlutterRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}
    
- (void)handleButtonAction {
    [FlutterBoostPlugin open:@"first" urlParams:@{kPageCallBackId:@"MycallbackId#1"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
        NSLog(@"call me when page finished, and your result is:%@", result);
    } completion:^(BOOL f) {
        NSLog(@"page is opened");
    }];
//    [MyFlutterRouter.sharedRouter open:@"first" urlParams:@{} exts:@{} completion:^(BOOL isFinish){}];
    
//    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
//    flutterViewController.view.backgroundColor = [UIColor cyanColor];
//    [flutterViewController setInitialRoute:@"route1"];
//    [self presentViewController:flutterViewController animated:YES completion:nil];
}


@end
