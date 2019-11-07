//
//  UIViewController+CDRoute.m
//  FT_iPhone
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 ChangDao. All rights reserved.
//

#import "UIViewController+CDRoute.h"

#import <JLRoutes/JLRoutes.h>
#import <objc/runtime.h>

#import "CDRouterService.h"
#import <YYCategories/YYCategories.h>

@interface UIViewController ()

@end

@implementation UIViewController (CDRoute)

//MARK: 正常push
- (void)routeUrl:(NSString *)url {
    [self routeUrl:url param:nil];
}

- (void)routeUrl:(NSString *)url param:(NSDictionary *)param {
    @weakify(self);
    [self routeUrl:url param:param handler:^(NSDictionary<NSString *,id> * _Nullable parameters, UIViewController<CDRRouteDefinitionTargetController> * _Nullable targetVC) {
        
        @strongify(self);
        if (self.navigationController) {
            
            [self.navigationController pushViewController:targetVC animated:true];
        } else {
            
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:targetVC] animated:true completion:^{
            }];
        }
    }];
}

//MARK: 模态弹出
- (void)presentRouteUrl:(NSString *)url param:(NSDictionary *)param {
    
    @weakify(self);
    [self routeUrl:url param:param handler:^(NSDictionary<NSString *,id> * _Nullable parameters, UIViewController<CDRRouteDefinitionTargetController> * _Nullable targetVC) {
        
        @strongify(self);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:targetVC];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:nav animated:true completion:^{
        }];
    }];
}


- (void)routeUrl:(NSString *)url handler:(CDRouterServiceCallBackBlock)handlerBlock {
    [self routeUrl:url param:nil handler:handlerBlock];
}

- (void)routeUrl:(NSString *)url param:(NSDictionary *)param handler:(CDRouterServiceCallBackBlock)handlerBlock {
    
    if (!param) param = @{};
        
    [[CDRouterService manager] routeURL:[NSURL URLWithString:url] withParameters:param handler:handlerBlock];
}

@end
