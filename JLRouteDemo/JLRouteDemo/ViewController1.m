//
//  ViewController1.m
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/5.
//  Copyright © 2019 cqz. All rights reserved.
//

#import "ViewController1.h"
#import "CDRRouteDefinitionTargetController.h"

@interface ViewController1 () <CDRRouteDefinitionTargetController>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[JLRoutes routesForScheme:@"Config"] routeURL:[NSURL URLWithString:@"CD://MouduleA/PresentViewController/present"] withParameters:@{@"userName": @"小明",
//                                                                                                                                @"dict":@{@"k":@"v"},
//                                                                           @"isLogin": @1
//    }];
//
//    
    NSLog(@"%@", NSStringFromClass([ViewController1 class]));
}
+ (nullable UIViewController <CDRRouteDefinitionTargetController> *)targetControllerWithParams:(nullable NSDictionary *)parameters {
    
    return [ViewController1 new];
}

@end
