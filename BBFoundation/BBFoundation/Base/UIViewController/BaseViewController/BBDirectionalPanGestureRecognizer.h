//
//  BBDirectionalPanGestureRecognizer.h
//  BBFoundation
//
//  Created by Gary on 8/20/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BBPanDirection) {
    BBPanDirectionRight,
    BBPanDirectionDown,
    BBPanDirectionLeft,
    BBPanDirectionUp
};

@interface BBDirectionalPanGestureRecognizer : UIPanGestureRecognizer

@property (nonatomic) BBPanDirection direction;

@end
