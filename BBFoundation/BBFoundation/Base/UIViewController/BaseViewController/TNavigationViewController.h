//
//  TNavigationViewController.h
//  BBProject
//
//  Created by Gary on 8/20/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBDirectionalPanGestureRecognizer.h"

typedef NS_ENUM(NSUInteger, BBNavigationViewControllerNavigationBarVisibility) {
    BBNavigationViewControllerNavigationBarVisibilityUndefined = 0, // Initial value, don't set this
    BBNavigationViewControllerNavigationBarVisibilitySystem = 1, // Use System navigation bar
    BBNavigationViewControllerNavigationBarVisibilityHidden = 2, // Use custom navigation bar and hide it
    BBNavigationViewControllerNavigationBarVisibilityVisible = 3 // Use custom navigation bar and show it
};

@protocol BBNavigationViewControllerDelegate <NSObject>

/**
 You should give back the correct enum value if the controller asks you
 */
- (BBNavigationViewControllerNavigationBarVisibility)preferredNavigationBarVisibility;

@end

@interface TNavigationViewController : UINavigationController

@property (nonatomic ,assign) BOOL canDragBack;

- (void)setNeedsNavigationBarVisibilityUpdateAnimated:(BOOL)animated;

@end
