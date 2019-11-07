//
//  CDRRouteDefinitionTargetController.h
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 cqz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CDRRouteDefinitionTargetController <NSObject>

/**
 创建控制器
 
 @param parameters 参数
 @return 控制器(如果为空, 则不能 handleUrl)
 */
+ (nullable UIViewController <CDRRouteDefinitionTargetController> *)targetControllerWithParams:(nullable NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
