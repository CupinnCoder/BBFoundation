//
//  TableViewLoadingItem.h
//  BBProject
//
//  Created by Gary on 8/20/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import "BBTableViewItem.h"

@interface TableViewLoadingItem : BBTableViewItem


@property (copy, readwrite, nonatomic) void (^onViewClickHandler)(id item,NSInteger actionType);

+ (TableViewLoadingItem *)itemWithTitle:(NSString *)title
                       clickHandler:(void(^)(TableViewLoadingItem *item,NSInteger actionType))clickHandler
                   selectionHandler:(void(^)(TableViewLoadingItem *item))selectionHandler;


@end
