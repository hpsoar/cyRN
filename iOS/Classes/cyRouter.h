//
//  RouteManager.h
//  SymptomChecker
//
//  Created by HuangPeng on 11/3/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, cyRouteType) {
    cyRouteTypePush,
    cyRouteTypeModal,
    cyRouteTypeModalWithNavigation,
};

/**
 *  operation on current controller
 *  1. push controller
 *  2. present modal controller, wrapped in navigation
 *  3. present modal controller, as it is
 
 *  TODO:
 *  4. present modal dialog, with webview
 *  5. present predefined modal dailog
 
 *  6. trigger route from webview links
 *
 *  7. dynamically add UI components, which may trigger route, which may trigger share
 
 *  X. refactor share module
 */

@protocol RoutableVC <NSObject>

- (instancetype)initWithQuery:(NSDictionary *)query;

@end

@interface cyRouter : NSObject

/**
 *  @param controllerClass conforms to RoutableVC
 *  @param query           params passed to RoutableVC instance
 *  @param routeType       
 */
+ (void)open:(Class)controllerClass withQuery:(NSDictionary *)query routeType:(cyRouteType)routeType;

/**
 *  @param clsString    a controller class, which must implement RoutableVC
 *  @param query        parameters
 */
+ (void)route:(NSString *)clsString withQuery:(NSDictionary *)query routeType:(cyRouteType)routeType;

+ (void)dismissModalVC:(BOOL)animated;
+ (void)popVC:(BOOL)animated;

+ (UIViewController *)topVC;

@end

