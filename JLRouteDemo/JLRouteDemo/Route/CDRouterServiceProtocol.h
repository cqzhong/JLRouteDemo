//
//  CDRouterServiceProtocol.h
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 cqz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDRRouteDefinitionTargetController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CDRouterServiceCallBackBlock)( NSDictionary<NSString *, id>  * _Nullable parameters, UIViewController <CDRRouteDefinitionTargetController>* _Nullable targetVC);


@protocol CDRouterServiceProtocol <NSObject>

/**
 配置路由协议， 可自定义配置， 默认 innerApp
 */
@property (nonatomic, copy) NSString *routeScheme;

/**
 注册路由（自定义命名空间注册）
 
 @param routePattern 路由地址
 @param scheme urlScheme 命名空间
 @param handlerBlock 参数回调
 */

- (void)addRoute:(NSString *)routePattern scheme:(NSString *)scheme handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock;

/**
注册路由 （使用默认空间innerApp）

@param routePattern 路由地址
@param handlerBlocks 参数回调
*/
- (void)addRoute:(NSString *)routePattern handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlocks;


/**
 打开路由地址
 
 @param routeURL 路由地址
 @param handlerBlock 回调函数
 */
- (void)routeURL:(nullable NSURL *)routeURL withParameters:(nullable NSDictionary<NSString *, id> *)parameters handler:(__nullable CDRouterServiceCallBackBlock)handlerBlock;

@end

NS_ASSUME_NONNULL_END
