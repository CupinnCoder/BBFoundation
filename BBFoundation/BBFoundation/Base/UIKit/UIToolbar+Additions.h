//
//  UIToolbar+Additions.h
//  MPBFramework
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (Additions)
- (UIBarButtonItem*)itemWithTag:(NSInteger)tag;

- (void)replaceItemWithTag:(NSInteger)tag withItem:(UIBarButtonItem*)item;
@end
