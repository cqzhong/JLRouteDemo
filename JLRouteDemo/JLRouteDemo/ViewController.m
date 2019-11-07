//
//  ViewController.m
//  JLRouteDemo
//
//  Created by cqz on 2019/5/31.
//  Copyright © 2019 cqz. All rights reserved.
//

#import "ViewController.h"
#import <JLRoutes/JLRoutes.h>
#import "UIViewController+CDRoute.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[JLRoutes globalRoutes] routeURL:[NSURL URLWithString:@"/ViewController1"]
//        withParameters:@{@"userName": @"小明",
//                         @"password":@110110110,
//                         @"isLogin": @1
//                         }];
    // [JLRoutes routesForScheme:@"Config"]
    
//    [[JLRoutes globalRoutes]  routeURL:[NSURL URLWithString:@"CD://MouduleA/ViewController1/push"] withParameters:@{@"userName": @"小明",
//                                                                           @"dict":@{@"k":@"v"},
//                                                                           @"isLogin": @1
//    }];
 
    NSLog(@"%@", NSStringFromClass([ViewController class]));

    [self routeUrl:@"CD:/ViewController1"];
}


@end
