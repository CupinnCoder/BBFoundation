//
//  ListHeaderView.m
//  PDMS
//
//  Created by Gary on 7/22/14.
//  Copyright (c) 2014 Gary. All rights reserved.
//

#import "BBListHeaderView.h"



@implementation BBListHeaderView

+ (BBListHeaderView *)headerView
{
    BBListHeaderView *view = [[BBListHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(TTScreenBounds()), 0)];
    return view;
}



+ (BBListHeaderView *)headerViewWithHeight:(CGFloat)height {
    BBListHeaderView *view = [[BBListHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(TTScreenBounds()), height)];
    return view;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

@end
