//
//  RouteManager.m
//  SymptomChecker
//
//  Created by HuangPeng on 11/3/15.
//
//

#import "cyRouter.h"

@implementation cyRouter

+ (void)open:(Class)controllerClass withQuery:(NSDictionary *)query routeType:(cyRouteType)routeType {
    if ([controllerClass resolveInstanceMethod:@selector(initWithQuery:)]) {
        id para = query[@"animated"];
        BOOL animated = para ? [para boolValue] : YES;
        UIViewController *vc = [[controllerClass alloc] initWithQuery:query];
        if (routeType == cyRouteTypeModal) {
            [[self topVC] presentViewController:vc animated:animated completion:nil];
        }
        else if (routeType == cyRouteTypeModalWithNavigation) {
            vc = [[UINavigationController alloc] initWithRootViewController:vc];
            [[self topVC] presentViewController:vc animated:animated completion:nil];
        }
        else if (routeType == cyRouteTypePush) {
            [[self topVC].navigationController pushViewController:vc animated:animated];
        }
    }
    else {
        NSAssert(NO, @"`%@` did not implement protocol `%@`", controllerClass, NSStringFromProtocol(@protocol(RoutableVC)));
    }
}

+ (void)route:(NSString *)clsString withQuery:(NSDictionary *)query routeType:(cyRouteType)routeType {
    Class cls = NSClassFromString(clsString);
    if (cls) {
        [self open:cls withQuery:query routeType:routeType];
    }
    else {
        NSAssert(NO, @"class `%@` is not defined!", clsString);
    }
}

+ (void)popVC:(BOOL)animated {
    UIViewController *vc = self.topVC;
    NSAssert(vc != nil, @"top view controller is nil");
    
    [vc.navigationController popViewControllerAnimated:animated];
}

+ (void)dismissModalVC:(BOOL)animated {
    UIViewController *vc = self.topVC;
    
    NSAssert(vc.presentedViewController != nil, @"`%@`.presentedViewController is nil", vc);
    
    [vc.presentedViewController dismissViewControllerAnimated:animated completion:nil];
}

+ (UIViewController *)topVC {
    UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController *)vc viewControllers].lastObject;
    }
    return vc;
}

@end


