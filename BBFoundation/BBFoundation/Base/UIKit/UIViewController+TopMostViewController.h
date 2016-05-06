//
//  UIViewController+TopMostViewController.h
//  BBFoundation
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2015 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TopMostViewController)

- (UIViewController *)topMostViewController;

@end

@interface UIApplication (TopMostViewController)

- (UIViewController *)topMostViewController;

@end
