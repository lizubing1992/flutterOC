//
//  MyFlutterRouter.m
//  界面的统一跳转 Flutter相关
//

#import "MyFlutterRouter.h"
#import <UIKit/UIKit.h>

@interface MyFlutterRouter()

@property(nonatomic, strong, readonly) UIViewController *currentFlutterVC;

@end

@implementation MyFlutterRouter
  
+ (instancetype)sharedRouter
{
    static MyFlutterRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MyFlutterRouter alloc] init];
        // 在这里初始化FlutterViewController 初始化Router
        [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:_instance onStart:^(FlutterEngine *engine){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                MyFlutterRouter.sharedRouter.fvc = engine.viewController;
               
            });
        }];
    });
    return _instance;
}


- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController pushViewController:vc animated:animated];
    if(completion) completion(YES);
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}



@end
