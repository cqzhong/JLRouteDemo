//
//  CDRouterService.m
//  JLRouteDemo
//
//  Created by cqzhong on 2019/11/6.
//  Copyright © 2019 cqz. All rights reserved.
//

#import "CDRouterService.h"

#import <JLRoutes/JLRoutes.h>
#import <YYCategories/YYCategories.h>

static NSString *const kRouteScheme = @"innerApp";

@interface CDRouterService ()

@property (nonatomic, strong) JLRoutes *routeCenter;

@end

@implementation CDRouterService
@synthesize routeScheme = _routeScheme;


//// MARK: - Protocol method begin

- (void)addRoute:(NSString *)routePattern scheme:(NSString *)scheme handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock {
    //  自定义命名空间注册
    [[JLRoutes routesForScheme:scheme] addRoute:routePattern handler:handlerBlock];
}

- (void)addRoute:(NSString *)routePattern handler:(BOOL (^)(NSDictionary<NSString *, id> *parameters))handlerBlock {
    
    [self.routeCenter addRoute:routePattern handler:handlerBlock];
}


- (void)routeURL:(nullable NSURL *)routeURL withParameters:(nullable NSDictionary<NSString *, id> *)parameters handler:(__nullable CDRouterServiceCallBackBlock)handlerBlock {
    
    if ([self.routeCenter canRouteURL:routeURL]) {
        
        self.handlerBlock = handlerBlock;
        [self.routeCenter routeURL:routeURL withParameters:parameters];
    }
}

- (void)setRouteScheme:(NSString *)routeScheme {
    if (routeScheme && ![_routeScheme isEqualToString:routeScheme]) {
        _routeScheme = routeScheme.copy;
        self.routeCenter = [JLRoutes routesForScheme:routeScheme.copy];
    }
}
- (NSString *)routeScheme
{
    if (!_routeScheme) {
        _routeScheme = kRouteScheme;
    }
    return _routeScheme;
}

// MARK: - Protocol method end
- (JLRoutes *)routeCenter {
    if (_routeCenter == nil) {
        _routeCenter = [JLRoutes routesForScheme:self.routeScheme];
    }
    return _routeCenter;
}

///单例
+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static CDRouterService *manager = nil;
    dispatch_once(&onceToken,^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        
        @weakify(self);
        [self addRoute:@"/:target" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
            
            Class targetControllerClass = NSClassFromString(parameters[@"target"]);
            if ([targetControllerClass isSubclassOfClass:[UIViewController class]]) {
                
                @strongify(self);
                if (!([targetControllerClass conformsToProtocol:@protocol(CDRRouteDefinitionTargetController)] || [targetControllerClass respondsToSelector:@selector(targetControllerWithParams:)])) {
                    
                    return false;
                }
                
                UIViewController <CDRRouteDefinitionTargetController> *vc = [targetControllerClass targetControllerWithParams:parameters];
                
                if (self.handlerBlock) {
                    self.handlerBlock(parameters, vc);
                    return true;
                }
                return false;
            }
            return false;
        }];
    }
    return self;
}
/**
 init负责初始化，alloc负责分配内存空间。alloc实际上是调用了allocWithZone方法，如果有人初始化这个单例类的时候不走[[Class alloc] init] ，而是直接 allocWithZone， 那么这个单例就不再是单例了，所以必须把这个方法也堵上
 **/
//+(id)allocWithZone:(NSZone *)zone{
//    return [self sharedInstance];
//}
//-(id)copyWithZone:(NSZone *)zone{
//    return [[self class] sharedInstance];
//}
//-(id)mutableCopyWithZone:(NSZone *)zone{
//    return [[self class] sharedInstance];
//}

@end
