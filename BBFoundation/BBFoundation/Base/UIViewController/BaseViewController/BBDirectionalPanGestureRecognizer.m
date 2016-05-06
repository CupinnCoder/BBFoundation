//
//  BBDirectionalPanGestureRecognizer.m
//  BBFoundation
//
//  Created by Gary on 8/20/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import "BBDirectionalPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface BBDirectionalPanGestureRecognizer()
@property (nonatomic) BOOL dragging;
@end

@implementation BBDirectionalPanGestureRecognizer

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (self.state == UIGestureRecognizerStateFailed) return;
    
    CGPoint velocity = [self velocityInView:self.view];
    
    // check direction only on the first move
    if (!self.dragging) {
        NSDictionary *velocities = @{
                                     @(BBPanDirectionRight) : @(velocity.x),
                                     @(BBPanDirectionDown) : @(velocity.y),
                                     @(BBPanDirectionLeft) : @(-velocity.x),
                                     @(BBPanDirectionUp) : @(-velocity.y)
                                     };
        NSArray *keysSorted = [velocities keysSortedByValueUsingSelector:@selector(compare:)];
        
        // Fails the gesture if the highest velocity isn't in the same direction as `direction` property.
        if ([[keysSorted lastObject] integerValue] != self.direction) {
            self.state = UIGestureRecognizerStateFailed;
        }
        
        self.dragging = YES;
    }
}

- (void)reset
{
    [super reset];
    
    self.dragging = NO;
}

@end
