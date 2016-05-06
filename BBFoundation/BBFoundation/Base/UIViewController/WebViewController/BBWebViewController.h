//
//  BBWebViewController.h
//  BBFoundation
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import "TSubViewController.h"
#import "WebViewJavascriptBridge.h"

typedef NS_ENUM(NSInteger, LocalViewType) {
    LocalViewTypeNone        = 0,
    LocalViewTypeTimeDetail  = 1,
    LocalViewTypeTopicDetail = 2,
    LocalViewTypeUserDetail  = 3,
    LocalViewTypeEventDetail  = 4,
    LocalViewTypeCalenderEvent = 5,
};


@interface BBWebViewController : TSubViewController<UIWebViewDelegate>

@property (nonatomic ,strong) UIWebView     *webView;
@property (nonatomic ,copy)   NSString      *url;
@property (nonatomic ,assign) LocalViewType shareType;
@property (nonatomic ,strong) WebViewJavascriptBridge *jsBridge;


- (id)initWithUrl:(NSString *)url;
- (id)initWithUrl:(NSString *)url share:(LocalViewType)shareType;

- (void)openURL:(NSURL*)URL;

- (void)regestBridge;


@end
