//
//  UIViewController+CDRoute.h
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 cqz. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIViewController (CDRoute)

// 正常push
- (void)routeUrl:(NSString *)url;
- (void)routeUrl:(NSString *)url param:(NSDictionary *)param;


// 模态弹出
- (void)presentRouteUrl:(NSString *)url param:(NSDictionary *)param;

@end
