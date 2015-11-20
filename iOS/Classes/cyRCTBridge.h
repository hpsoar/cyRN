//
//  cyRCTPipe.h
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import <UIKit/UIKit.h>

@class cyRCTFunc;

/**
 *  cyRCTPipe module
 */
@interface cyRCTBridge : NSObject <RCTBridgeModule>

- (void)registerFunc:(cyRCTFunc *)func name:(NSString *)name;
- (void)registerFunc:(cyRCTFunc *)func;
- (void)unregisterFunc:(NSString *)name;

@end

