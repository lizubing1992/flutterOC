//
//  AppDelegate.m
//  flutterOC
//
//  Created by nongfadai on 2019/5/15.
//  Copyright © 2019 nongfadai. All rights reserved.
//

#import "AppDelegate.h"
#import "MyFlutterRouter.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MyFlutterRouter *router = [MyFlutterRouter sharedRouter];
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
     
      FLBFlutterViewContainer *fvc = FLBFlutterViewContainer.new;
      [fvc setName:@"tab" params:@{}];
      fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
      
      UITabBarController *tabVC = [[UITabBarController alloc] init];
      UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
      
      router.navigationController = rvc;
      
      tabVC.viewControllers = @[vc,fvc];
      
      self.window.rootViewController = rvc;
     
      UIButton *nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
      nativeButton.frame = CGRectMake(self.window.frame.size.width * 0.5 - 50, 200, 100, 45);
      nativeButton.backgroundColor = [UIColor redColor];
      [nativeButton setTitle:@"push native" forState:UIControlStateNormal];
      [nativeButton addTarget:self action:@selector(pushNative) forControlEvents:UIControlEventTouchUpInside];
      [self.window addSubview:nativeButton];
    
    
    
    return YES;
}
- (void)pushNative
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    ViewController *vc = [[ViewController alloc] init];
    [nvc pushViewController:vc animated:YES];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
