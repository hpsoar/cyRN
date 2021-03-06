//
//  cyRCTManager.m
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "cyRCT.h"
#import "cyRCTBridge.h"
#import "cyRCTFunc.h"

@implementation cyRCT

+ (instancetype)sharedManager {
  static id instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [self new];
  });
  return instance;
}

- (void)setupWithJSHost:(NSString *)host LaunchOptions:(NSDictionary *)launchOptions {
  /**
   * Loading JavaScript code - uncomment the one you want.
   *
   * OPTION 1
   * Load from development server. Start the server from the repository root:
   *
   * $ npm start
   *
   * To run on device, change `localhost` to the IP address of your computer
   * (you can get this by typing `ifconfig` into the terminal and selecting the
   * `inet` value under `en0:`) and make sure your computer and iOS device are
   * on the same Wi-Fi network.
   */
  
  NSURL *jsCodeLocation = [NSURL URLWithString:[NSString stringWithFormat:@"%@/index.ios.bundle?platform=ios", host]];
  
  /**
   * OPTION 2
   * Load from pre-bundled file on disk. To re-generate the static bundle
   * from the root of your project directory, run
   *
   * $ react-native bundle --minify
   *
   * see http://facebook.github.io/react-native/docs/runningondevice.html
   */
  
  //   jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
  
  // Here we are instantiating the `RCTBridge` to be used in other parts of the app later.
  _bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                 moduleProvider:nil
                                  launchOptions:launchOptions];
  
  
  cyRCTBridge *cyBridge = [[cyRCT sharedManager] nativeModuleForString:@"cyRCTBridge"];
  [cyBridge registerFunc:[cyRCTFuncDismissModalVC new]];
  [cyBridge registerFunc:[cyRCTFuncPopVC new]];
}

- (id)nativeModuleForString:(NSString *)moduleName {
  return self.bridge.modules[moduleName];
}

- (void)verifyModules:(NSArray *)modules {
#warning TODO
}

@end
