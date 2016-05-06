//
//  TableViewLoadingItemCell.h
//  BBFoundationFire
//
//  Created by Gary on 9/10/15.
//  Copyright (c) 2015 BBFoundation. All rights reserved.
//

#import "BBTableViewItemCell.h"
#import "TableViewLoadingItem.h"
#import "FLAnimatedImageView.h"

@interface TableViewLoadingItemCell : BBTableViewItemCell

@property (strong, readwrite, nonatomic) TableViewLoadingItem    *item;

@property (strong ,nonatomic           ) FLAnimatedImageView     *loadingImageView;

@property (strong ,nonatomic           ) UIActivityIndicatorView *loadingView;

@end
