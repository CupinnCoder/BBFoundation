//
//  TableViewLoadingItemCell.m
//  BBFoundationFire
//
//  Created by Gary on 9/10/15.
//  Copyright (c) 2015 BBFoundation. All rights reserved.
//

#import "TableViewLoadingItemCell.h"
#import "FLAnimatedImage.h"
#import "BBDefaultStyle.h"
#import "BBCoreFoundationMacro.h"
#import "UIAdditions.h"

@implementation TableViewLoadingItemCell

@dynamic item;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark 列表生命周期
+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager {
    //列表高度
    return 60;
}


- (void)cellDidLoad {
    [super cellDidLoad];
    //创建控件
    //    self.loadingImageView = [[FLAnimatedImageView alloc] init];
    //    self.loadingImageView.frame = CGRectMake(10, 0, 60, 60);
    //    [self addSubview:self.loadingImageView];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:self.loadingView];
    
    self.textLabel.textColor = BBSTYLEVAR(loadingTextColor);
    self.textLabel.font = BBSTYLEVAR(font14);
}
- (void)cellWillAppear {
    [super cellWillAppear];
    //页面元素赋值
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"PullupLoading" withExtension:@"gif"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
    self.loadingImageView.animatedImage = image;
    
    [self.loadingView startAnimating];
    
}
- (void)cellDidDisappear {
    [super cellDidDisappear];
    //页面重用准备
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //页面布局调整
    self.loadingImageView.size = CGSizeMake(60, 60);
    self.loadingImageView.center = self.contentView.center;
    
    self.loadingView.center = self.contentView.center;
    
    [self.textLabel sizeToFit];
    self.textLabel.centerY = self.loadingView.centerY;
    CGFloat left = (self.width - (self.loadingView.width + self.textLabel.width) ) / 2;
    self.loadingView.left = left;
    self.textLabel.left = self.loadingView.right + 6;
    
}

#pragma mark - Private
- (void)onViewClick:(id)sender {
    
}


@end
