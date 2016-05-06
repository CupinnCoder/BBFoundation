//
//  NSObject+BBCore.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSObject (BBCore)

- (nullable id)bb_performSelectorWithArgs:(SEL)sel, ...;
- (void)bb_performSelectorWithArgs:(SEL)sel afterDelay:(NSTimeInterval)delay, ...;
- (nullable id)bb_performSelectorWithArgsOnMainThread:(SEL)sel waitUntilDone:(BOOL)wait, ...;
- (nullable id)bb_performSelectorWithArgs:(SEL)sel onThread:(NSThread *)thread waitUntilDone:(BOOL)wait, ...;
- (void)bb_performSelectorWithArgsInBackground:(SEL)sel, ...;
- (void)bb_performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay;

#pragma mark - Swap method (Swizzling)
+ (BOOL)bb_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;
+ (BOOL)bb_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

#pragma mark - Associate value
- (void)bb_setAssociateValue:(nullable id)value withKey:(void *)key;
- (void)bb_setAssociateWeakValue:(nullable id)value withKey:(void *)key;
- (nullable id)bb_getAssociatedValueForKey:(void *)key;
- (void)bb_removeAssociatedValues;

#pragma mark - Others
+ (NSString *)bb_className;
- (NSString *)bb_className;
- (nullable id)bb_deepCopy;
- (nullable id)bb_deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver;

@end
NS_ASSUME_NONNULL_END