//
//  UIButton+Expand.h
//  BBFoundation
//  扩展UIButton,增加属性
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAdditions.h"

@interface UIButton (Expand)

@property (nonatomic, assign) id expand;
@property (nonatomic, weak) void (^DeleteBlock)(id expand);


+ (UIButton*) createButtonWithFrame: (CGRect) frame target:(id)target
                           selector:(SEL)selector image:(NSString *)image
                       imagePressed:(NSString *)imagePressed;
+ (UIButton *) createButtonWithImage:(NSString *)image
                        imagePressed:(NSString *)imagePressed
                              target:(id)target
                            selector:(SEL)selector;
+ (UIButton *) createButtonWithFrame:(CGRect)frame title:(NSString *)title
                              target:(id)target selector:(SEL)selector;

+ (UIButton *) createButtonWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;

- (void)centerImageAndTitle:(float)spacing;
- (void)centerImageAndTitle;

- (void)centerImageAndButton:(CGFloat)gap imageOnTop:(BOOL)imageOnTop;

- (void)showDeleteView:(void (^)(id expand))deleteBlock;

@end
