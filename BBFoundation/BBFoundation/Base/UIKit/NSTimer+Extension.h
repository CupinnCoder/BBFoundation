//
//  NSTimer+Extension.h
//  TFProject
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)

+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
+(id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

-(void)pauseTimer;
-(void)resumeTimer;

@end
