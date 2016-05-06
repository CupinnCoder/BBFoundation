//
//  BBDeviceUtility.m
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import "BBDeviceUtility.h"
#import "SSKeychain.h"

@implementation BBDeviceUtility

+(instancetype)shared {
    static BBDeviceUtility* utility = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!utility) {
            utility = [[self alloc] init];
        }
    });
    return utility;
}


- (NSString *)getDeviceId {
    NSString *idfv = [SSKeychain passwordForService:@"bb__ios" account:@"app_user"];
    if (!idfv) {
        idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:idfv forService:@"bb__ios" account:@"app_user"];
    }
    return idfv;
}

@end
