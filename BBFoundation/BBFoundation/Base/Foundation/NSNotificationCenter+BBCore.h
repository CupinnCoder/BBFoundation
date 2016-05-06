//
//  NSNotificationCenter+BBCore.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSNotificationCenter (BBCore)

- (void)bb_postNotificationOnMainThread:(NSNotification *)notification;
- (void)bb_postNotificationOnMainThread:(NSNotification *)notification
                       waitUntilDone:(BOOL)wait;
- (void)bb_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object;
- (void)bb_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;
- (void)bb_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;

@end
NS_ASSUME_NONNULL_END