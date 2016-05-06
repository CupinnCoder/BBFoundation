//
//  TSubTableViewController.h
//  BBFoundationFire
//
//  Created by Gary on 9/9/15.
//  Copyright (c) 2015 BBFoundation. All rights reserved.
//

#import "TSubViewController.h"
#import "BBTableViewDataSource.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface TSubTableViewController : TSubViewController <BBTableViewDataSourceDelegate>


@property (nonatomic ,strong ,readonly) UITableView           *tableView;
@property (nonatomic ,strong ,readonly) ASTableView           *asTableView;
@property (nonatomic ,assign          ) UITableViewStyle      tableViewStyle;
@property (nonatomic ,strong ,readonly) BBTableViewDataSource *dataSource;
@property (nonatomic ,assign          ) NSInteger             listType;
@property (nonatomic ,assign          ) BOOL                  loaded;
@property (nonatomic ,assign          ) BOOL                  usePullReload;
@property (nonatomic ,assign          ) BOOL                  useASKit;


@end
