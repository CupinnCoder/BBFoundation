//
//  BBSecurityUtility.m
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import "BBSecurityUtility.h"
#import <CommonCrypto/CommonDigest.h>

@implementation BBSecurityUtility

+(instancetype)shared {
    static BBSecurityUtility* utility = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!utility) {
            utility = [[self alloc] init];
        }
    });
    return utility;
}



- (NSString *)getMD5StringFromNSString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([data bytes], (CC_LONG)[data length], digest);
    NSMutableString *result = [NSMutableString string];
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat: @"%02x", (int)(digest[i])];
    }
    return [result copy];
}
@end
