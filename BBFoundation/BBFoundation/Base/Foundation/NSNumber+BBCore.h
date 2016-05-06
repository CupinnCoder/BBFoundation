//
//  NSNumber+BBCore.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (BBCore)
+ (nullable NSNumber *)bb_numberWithString:(NSString *)string;

@end
NS_ASSUME_NONNULL_END