//
//  TSubViewController.h
//  BBProject
//
//  Created by Gary on 8/18/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
#import <JDStatusBarNotification/JDStatusBarNotification.h>
#import "NetworkAssistant.h"
#import "BBDefaultStyle.h"
#import "BBCoreUtility.h"
#import "ViewControllerDelegate.h"
#import "BBAlertView.h"
#import "BBCoreFoundationMacro.h"
#import "BBStateView.h"
#import "ViewGuideModel.h"


typedef id (^BBViewControllerBlock)(id object);

// toast提示类型
typedef NS_ENUM (NSInteger, MessageType) {
    /**
     *  默认提示
     */
    MessageTypeDefault = 0,
    /**
     *  成功提示
     */
    MessageTypeSuccess = 1,
    /**
     *  失败提示
     */
    MessageTypeFaild   = 2,
    /**
     *  一般性消息提示
     */
    MessageTypeInfo    = 3
};

@interface TSubViewController : UIViewController
/**
 *  页面参数
 */
@property (nonatomic ,strong ,readonly) NSDictionary        *params;
/**
 *  页面数据请求参数
 */
@property (nonatomic ,strong ,readonly) NSMutableDictionary *requestParams;

@property (nonatomic ,weak) id<ViewControllerDelegate> viewControllerDelegate;

@property (nonatomic ,assign) NSInteger   viewState;

@property (nonatomic ,weak) BBViewControllerBlock   ViewControllerBlock;

@property (nonatomic ,strong           ) BBStateView              *stateView;


#pragma mark - Public
- (void)showBackButton;
- (void)showStateView:(NSInteger)viewState;
- (void)removeStateView;

-(void)startGuide:(ViewGuideModel *)model;

- (void)showToastMessage:(NSString *)message messageType:(MessageType)messageType;
- (void)dismissToastView;
- (NSString *)stateViewTitle:(NSInteger)viewState;
- (NSString *)stateViewButtonTitle:(NSInteger)viewState;
- (UIImage *)stateViewImage:(NSInteger)viewState;

@end
