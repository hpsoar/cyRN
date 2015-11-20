//
//  cyRCTFunc.h
//  cyRN
//
//  Created by HuangPeng on 11/20/15.
//  Copyright © 2015 SpringRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

// cyRCTFunc
@interface cyRCTFunc : NSObject

@property (nonatomic, readonly) NSString *funcName;

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback;

- (void)invoke;

- (void)runInMainQueue:(dispatch_block_t)block;

@end

// functions
#define kRCTFuncDismissModalVC @"dissmiss_vc"
#define kRCTFuncPopVC @"pop_vc"

// params
#define kRCTFuncParameterAnimated @"animated"

@interface cyRCTFuncDismissModalVC : cyRCTFunc

@end

@interface cyRCTFuncPopVC : cyRCTFunc

@end
