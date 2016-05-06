//
//  BBSecurityUtility.h
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBSecurityUtility : NSObject


+ (instancetype)shared;

/**
 *  对一个string进行md5加密
 *
 *  @param string
 *
 *  @return 
 */
- (NSString *)getMD5StringFromNSString:(NSString *)string;

@end
