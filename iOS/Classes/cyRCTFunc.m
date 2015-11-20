//
//  cyRCTFunc.m
//  cyRN
//
//  Created by HuangPeng on 11/20/15.
//  Copyright © 2015 SpringRain. All rights reserved.
//

#import "cyRCTFunc.h"
#import "cyRouter.h"

@implementation cyRCTFunc

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
    
}

- (void)invoke {
    [self invoke:nil callback:nil];
}

- (void)runInMainQueue:(dispatch_block_t)block {
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

@end

BOOL cyRCTParamBool(NSDictionary *dict, NSString *name, BOOL defaultValue) {
    id param = dict[name];
    return param ? [param boolValue] : defaultValue;
}

@implementation cyRCTFuncDismissModalVC

- (NSString *)funcName {
    return kRCTFuncDismissModalVC;
}

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
    BOOL animated = cyRCTParamBool(params, kRCTFuncParameterAnimated, YES);
    [self runInMainQueue:^{
        [cyRouter dismissModalVC:animated];
    }];
}

@end

@implementation cyRCTFuncPopVC

- (NSString *)funcName {
    return kRCTFuncPopVC;
}

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
    BOOL animated = cyRCTParamBool(params, kRCTFuncParameterAnimated, YES);
    [self runInMainQueue:^{
        [cyRouter popVC:animated];
    }];
}

@end