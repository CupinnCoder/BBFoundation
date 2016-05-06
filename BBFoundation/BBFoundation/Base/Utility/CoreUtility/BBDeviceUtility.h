//
//  BBDeviceUtility.h
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBDeviceUtility : NSObject


+ (instancetype)shared;



/*
 *  获取设备唯一编号
 *
 *  @return
 */
- (NSString *)getDeviceId;

@end
