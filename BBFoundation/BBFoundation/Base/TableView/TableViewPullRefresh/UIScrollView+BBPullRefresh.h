//
//  UIScrollView+BBPullRefresh.h
//  BBFoundation
//
//  Created by Gary on 8/13/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>

@class BBTableRefreshView;
@interface UIScrollView (BBPullRefresh)

typedef NS_ENUM(NSUInteger, BBPullRefreshPosition) {
    BBPullRefreshPositionTop = 0,
    BBPullRefreshPositionBottom,
};
/**
 *  添加刷新组件
 *
 *  @param actionHandler 回调
 */
- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler;
/**
 *  添加刷新组建
 *
 *  @param actionHandler 回调
 *  @param position      刷新组件位置
 */
- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler position:(BBPullRefreshPosition)position;
/**
 *  移除事件
 */
- (void)removePullToRefreshActionHandler;
/**
 *  触发
 */
- (void)triggerPullToRefresh;
/**
 *  中断下拉刷新
 */
- (void)stopPullToRefresh;

@property (nonatomic, strong, readonly) BBTableRefreshView *pullToRefreshView;
@property (nonatomic, assign) BOOL showsPullToRefresh;

@end

/**
 *  下拉刷新状态
 */
typedef NS_ENUM(NSInteger ,BBPullRefreshState){
    /**
     *  默认状态
     */
    BBPullRefreshStateStopped   = 0,
    /**
     *  触发
     */
    BBPullRefreshStateTriggered = 1,
    /**
     *  正在加载
     */
    BBPullRefreshStateLoading   = 2,
    /**
     *
     */
    BBPullRefreshStateAll       = 10
};


@interface BBTableRefreshView : UIView

@property (nonatomic, readonly) BBPullRefreshState    state;
@property (nonatomic, readonly) BBPullRefreshPosition position;

- (void)startAnimating;
- (void)stopAnimating;

@end
