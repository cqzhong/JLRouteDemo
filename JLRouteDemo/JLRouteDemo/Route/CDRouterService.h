//
//  CDRouterService.h
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 cqz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CDRouterServiceProtocol.h"

#define CDRouterManager  [CDRouterService manager]


@interface CDRouterService : NSObject <CDRouterServiceProtocol>

@property (nonatomic, copy) CDRouterServiceCallBackBlock handlerBlock;

+ (instancetype)manager;

@end
