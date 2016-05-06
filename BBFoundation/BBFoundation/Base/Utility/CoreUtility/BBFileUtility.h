//
//  BBFileUtility.h
//  BBFoundation
//
//  Created by Gary on 10/14/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBFileUtility : NSObject


+ (instancetype)shared;


/**
 *  获取数据库存储路径
 */
- (NSString*)getDirectoryDBPath:(NSString *)dbName;

/**
 *  获取本地cache文件
 *
 *  @param URL
 *
 *  @return
 */
- (NSString *)tempFilePathForURL:(NSURL *)URL;
///**
// *  获取缓存文件路径
// *
// *  @param URL
// *
// *  @return
// */
//- (NSString *)realFilePathForURL:(NSURL *)URL;




@end
