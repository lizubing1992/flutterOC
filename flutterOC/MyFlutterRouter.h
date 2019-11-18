//
//  MyFlutterRouter.h
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <flutter_boost/FlutterBoost.h>
@interface MyFlutterRouter : NSObject<FLBPlatform>

@property(nonatomic, weak) FlutterViewController *fvc;
@property (nonatomic,strong) UINavigationController *navigationController;

+ (instancetype)sharedRouter;

@end
 

