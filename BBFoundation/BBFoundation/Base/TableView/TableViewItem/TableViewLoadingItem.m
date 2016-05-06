//
//  TableViewLoadingItem.m
//  BBProject
//
//  Created by Gary on 8/20/14.
//  Copyright (c) 2014 BBFoundation. All rights reserved.
//

#import "TableViewLoadingItem.h"

@implementation TableViewLoadingItem


+ (TableViewLoadingItem *)itemWithTitle:(NSString *)title
                           clickHandler:(void(^)(TableViewLoadingItem *item,NSInteger actionType))clickHandler
                       selectionHandler:(void(^)(TableViewLoadingItem *item))selectionHandler {
    TableViewLoadingItem *item = [[TableViewLoadingItem alloc] init];
    item.title = title;
    item.onViewClickHandler = clickHandler;
    item.selectionHandler = selectionHandler;
    return item;
}

@end
