//
//  BBJSBridge.h
//  BBFoundation
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 TNMP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kProtocolScheme         @"bbcall"
#define kBridgeName             @"external"

@interface BBJSBridge : NSObject

@property (nonatomic, weak) UIWebView *webView;

+ (instancetype)bridgeForWebView:(UIWebView*)webView webViewDelegate:(NSObject<UIWebViewDelegate>*)webViewDelegate;
+ (instancetype)bridgeForWebView:(UIWebView*)webView webViewDelegate:(NSObject<UIWebViewDelegate>*)webViewDelegate resourceBundle:(NSBundle*)bundle;

- (void)excuteJSWithObj:(NSString *)obj function:(NSString *)function;

@end