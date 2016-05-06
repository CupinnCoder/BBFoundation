//
//  BBTableDataSourceManager.h
//  
//
//  Created by Gary on 6/10/15.
//
//

#import <Foundation/Foundation.h>
#import "BBTableViewDataManagerProtocol.h"
#import "BBTableViewDataSource.h"
//
@interface BBTableViewDataManager : NSObject<BBTableViewDataManagerProtocol>

@property (nonatomic ,weak  ) BBTableViewDataSource *tableViewDataSource;
/**
 *  列表内点击事件 block
 */
@property (nonatomic ,strong) CellViewClickHandler   cellViewClickHandler;
/**
 *  列表行点击事件 block
 */
@property (nonatomic ,strong) SelectionHandler       selectionHandler;
/**
 *  列表删除事件 block
 */
@property (nonatomic ,strong) DeleteHanlder          deleteHanlder;
/**
 *  当前
 */
@property (nonatomic ,strong) NSIndexPath            *currentIndexPath;
/**
 *  列表类型
 */
@property (nonatomic ,assign) NSInteger                       listType;

@end
