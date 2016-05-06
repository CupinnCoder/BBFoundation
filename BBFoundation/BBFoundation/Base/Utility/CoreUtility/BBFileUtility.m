//
//  BBFileUtility.m
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import "BBFileUtility.h"
#import "BBCoreUtility.h"


@implementation BBFileUtility


+(instancetype)shared {
    static BBFileUtility* utility = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!utility) {
            utility = [[self alloc] init];
        }
    });
    return utility;
}

/**
 *  获取数据库存储路径
 */
- (NSString*)getDirectoryDBPath:(NSString *)dbName {
    NSArray *paths = nil;
#ifdef DEBUG
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
#else
    paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
#endif
    NSString *path = [paths objectAtIndex:0];;
    
    return [path stringByAppendingPathComponent:dbName] ;
    
}

- (NSString *)tempFilePathForURL:(NSURL *)URL {
    NSAssert(URL,@"URL is nil");
    
    NSString *fileExtension = [URL pathExtension];
    NSString *hashedURLString = [[BBCoreUtility sharedUtility] getMD5StringFromNSString:[URL absoluteString]];
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"cupinn_cache/"];
    BOOL isDirectory;
    if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDirectory isDirectory:&isDirectory] || !isDirectory) {
        NSError *error = nil;
        BOOL isDirectoryCreated = [[NSFileManager defaultManager] createDirectoryAtPath:cacheDirectory
                                                            withIntermediateDirectories:YES
                                                                             attributes:nil
                                                                                  error:&error];
        if (!isDirectoryCreated) {
            NSException *exception = [NSException exceptionWithName:NSInternalInconsistencyException
                                                             reason:@"Failed to crate cache directory"
                                                           userInfo:@{ NSUnderlyingErrorKey : error }];
            @throw exception;
        }
    }
    NSString *temporaryFilePath = [[cacheDirectory stringByAppendingPathComponent:hashedURLString] stringByAppendingPathExtension:fileExtension];
    return temporaryFilePath;
    
}
//- (NSString *)realFilePathForURL:(NSURL *)URL {
//    NSAssert(URL,@"URL is nil");
//    NSError *error = nil;
//    NSString *hashedURLString = [[BBCoreUtility sharedUtility] getMD5StringFromNSString:[URL absoluteString]];
//    NSString *homeDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    homeDirectory = [homeDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@/",[[BBCoreUtility sharedUtility] getUserId],hashedURLString]];
//    BOOL isDirectoryCreated = [[NSFileManager defaultManager] createDirectoryAtPath:homeDirectory
//                                                        withIntermediateDirectories:YES
//                                                                         attributes:nil
//                                                                              error:&error];
//    if (!isDirectoryCreated) {
//        NSException *exception = [NSException exceptionWithName:NSInternalInconsistencyException
//                                                         reason:@"Failed to crate cache directory"
//                                                       userInfo:@{ NSUnderlyingErrorKey : error }];
//        @throw exception;
//    }
//    return homeDirectory;
//    
//}

@end
