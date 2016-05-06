//
//  NSObject+BBCoreForKVO.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSObject (BBCoreForKVO)

- (void)bb_addObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)(id _Nonnull obj, _Nullable id oldVal, _Nullable id newVal))block;
- (void)bb_removeObserverBlocksForKeyPath:(NSString*)keyPath;
- (void)bb_removeObserverBlocks;

@end
NS_ASSUME_NONNULL_END