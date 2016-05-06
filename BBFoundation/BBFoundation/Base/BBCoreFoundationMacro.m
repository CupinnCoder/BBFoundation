//
//  BBCoreFoundationMacro.m
//  BBFoundation
//
//  Created by Gary on 5/4/16.
//  Copyright © 2016 Gary. All rights reserved.
//

#import "BBCoreFoundationMacro.h"


void BBAsyncRun(BBRun run) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        run();
    });
}

void BBMainRun(BBRun run) {
    dispatch_async_on_main_queue(^{
        run();
    });
}

NSString *  BB_APP_ERROR_DOMAIN        =      @"com.cupinn.corefoundation";

/////////////////////////////////////////////Common Error Code//////////////////////////////////////

NSInteger const kBBErrorCodeUnknown         = 0;
NSInteger const kBBErrorCodeAPI             = 1;
NSInteger const kBBErrorCodeHTTP            = 2;
NSInteger const kBBErrorCodeNetwork         = 3;
NSInteger const kBBErrorCodeEmpty           = 4;
NSInteger const kBBErrorCodeClassType       = 5;
NSInteger const kBBErrorCodeLocationError   = 6;
NSInteger const kBBErrorCodePhotosError     = 7;
NSInteger const kBBErrorCodeMicrophoneError = 8;
NSInteger const kBBErrorCodeCameraError     = 9;
NSInteger const kBBErrorCodeContactsError   = 10;


/////////////////////////////////////////////Common View State//////////////////////////////////////
NSInteger const kBBViewStateNone            = 0;
NSInteger const kBBViewStateLoading         = 1;
NSInteger const kBBViewStateNetError        = 2;
NSInteger const kBBViewStateDataError       = 3;
NSInteger const kBBViewStateNoData          = 4;
NSInteger const kBBViewStateTimeOut         = 5;
NSInteger const kBBViewStateLocationError   = 6;
NSInteger const kBBViewStatePhotosError     = 7;
NSInteger const kBBViewStateMicrophoneError = 8;
NSInteger const kBBViewStateCameraError     = 9;
NSInteger const kBBViewStateContactsError   = 10;

///////////////////////////////////////////Common ScrollDirection///////////////////////////////////
NSInteger const kBBScrollDirectionNone       = 0;
NSInteger const kBBScrollDirectionUp         = 1;
NSInteger const kBBScrollDirectionDown       = 2;
NSInteger const kBBScrollDirectionLeft       = 3;
NSInteger const kBBScrollDirectionRight      = 4;
NSInteger const kBBScrollDirectionVertical   = 5;
NSInteger const kBBScrollDirectionHorizontal = 6;


///////////////////////////////////////////Common Notification//////////////////////////////////////
NSString   *  kBBCloseWebViewNotification             =   @"kBBCloseWebViewNotification";
NSString   *  kBBOpenLocalNotification                =   @"kBBOpenLocalNotification";
NSString   *  kBBReloadCellNotification               =   @"kBBReloadCellNotification";
NSString   *  kBBAutoLoadNotification                 =   @"kBBAutoLoadNotification";


