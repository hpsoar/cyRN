//
//  cyRCTPipe.m
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "cyRCTBridge.h"
#import "cyRCTFunc.h"

@implementation cyRCTBridge {
  NSMutableDictionary *_funcMap;
}

RCT_EXPORT_MODULE()

// This is an exported method that is available in JS.
RCT_EXPORT_METHOD(invoke:(NSString *)method params:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback) {
  cyRCTFunc *func = _funcMap[method];
  [func invoke:params callback:callback];
}

RCT_EXPORT_METHOD(invoke:(NSString *)method) {
  [self invoke:method params:nil callback:nil];
}

RCT_EXPORT_METHOD(closeModalVC) {
  [self invoke:kRCTFuncDismissModalVC];
}

RCT_EXPORT_METHOD(popVC) {
  [self invoke:kRCTFuncPopVC];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _funcMap = [NSMutableDictionary new];
  }
  return self;
}

- (void)registerFunc:(cyRCTFunc *)func {
  [self registerFunc:func name:func.funcName];
}

- (void)registerFunc:(cyRCTFunc *)func name:(NSString *)name {
  _funcMap[name] = func;
}

- (void)unregisterFunc:(NSString *)name {
  [_funcMap removeObjectForKey:name];
}

@end
