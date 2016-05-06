//
//  BBStyle.h
//  BBProject
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 Gary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBStyle : NSObject


+ (BBStyle*)globalStyleSheet;

+ (void)setGlobalStyleSheet:(BBStyle*)styleSheet;

- (UIColor *)getColorByHex:(NSString *)hexColor;
- (UIColor *)getColorByHex:(NSString *)hexColor alpha:(CGFloat)alpha;

@end
