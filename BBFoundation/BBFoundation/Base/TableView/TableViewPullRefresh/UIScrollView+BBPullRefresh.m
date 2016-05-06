//
//  UIScrollView+BBPullRefresh.m
//  BBFoundation
//
//  Created by Gary on 8/13/15.
//  Copyright © 2015 BBFoundation. All rights reserved.
//

#import "UIScrollView+BBPullRefresh.h"
#import <objc/runtime.h>
#import "BBDefaultStyle.h"
#import "BBCoreUtility.h"
#import "BBCoreFoundationMacro.h"

#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)
#define fequalzero(a) (fabs(a) < FLT_EPSILON)

#pragma mark - BBTableRefreshView

static CGFloat const BBRefreshViewHeight = 62;

@interface BBTableRefreshView ()

@property (nonatomic, copy) void (^pullToRefreshActionHandler)(void);

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray *titles;

@property (nonatomic, readwrite) BBPullRefreshState    state;
@property (nonatomic, readwrite) BBPullRefreshPosition position;
@property (nonatomic, weak     ) UIScrollView          *scrollView;
@property (nonatomic, readwrite) CGFloat               originalTopInset;
@property (nonatomic, readwrite) CGFloat               originalBottomInset;

@property (nonatomic, assign   ) BOOL                  wasTriggeredByUser;
@property (nonatomic, assign   ) BOOL                  showsPullToRefresh;
@property (nonatomic, assign   ) BOOL                  isObserving;

- (void)resetScrollViewContentInset;
- (void)setScrollViewContentInseBBorLoading;
- (void)setScrollViewContentInset:(UIEdgeInsets)insets;

@end

@implementation BBTableRefreshView {
    NSInteger _currentValue;
}
- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.autoresizingMask   = UIViewAutoresizingFlexibleWidth;
        self.state              = BBPullRefreshStateStopped;
        self.titles = [NSMutableArray arrayWithObjects:NSLocalizedString(@"下拉刷新...",),
                       NSLocalizedString(@"释放刷新...",),
                       NSLocalizedString(@"正在刷新...",),
                       nil];
        _currentValue = 100;
        self.wasTriggeredByUser = YES;
        [self addSubview:self.titleLabel];
        _titleLabel.text = NSLocalizedString(@"下拉刷新...",);
        [_titleLabel sizeToFit];
        _titleLabel.centerX = CGRectGetWidth(TTScreenBounds())/2;
        _titleLabel.top = 15.f;
    }
    
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (self.superview && newSuperview == nil) {
        //use self.superview, not self.scrollView. Why self.scrollView == nil here?
        UIScrollView *scrollView = (UIScrollView *)self.superview;
        if (scrollView.showsPullToRefresh) {
            if (self.isObserving) {
                //If enter this branch, it is the moment just before "SVPullToRefreshView's dealloc", so remove observer here
                [scrollView removeObserver:self forKeyPath:@"contentOffset"];
                [scrollView removeObserver:self forKeyPath:@"contentSize"];
                [scrollView removeObserver:self forKeyPath:@"frame"];
                self.isObserving = NO;
            }
        }
    }
}

#pragma mark 界面控件布局
- (void)layoutSubviews {
    switch (self.state) {
        case BBPullRefreshStateAll:
        case BBPullRefreshStateStopped:
            switch (self.position) {
                case BBPullRefreshPositionTop:
                    //
                    break;
                case BBPullRefreshPositionBottom:
                    //
                    break;
            }
            break;
            
        case BBPullRefreshStateTriggered:
            switch (self.position) {
                case BBPullRefreshPositionTop:
                    //
                    break;
                case BBPullRefreshPositionBottom:
                    //
                    break;
            }
            break;
            
        case BBPullRefreshStateLoading:
            switch (self.position) {
                case BBPullRefreshPositionTop:
                    [self shakePointer];
                    break;
                case BBPullRefreshPositionBottom:
                    //
                    break;
            }
            break;
    }
    self.titleLabel.text = [self.titles objectAtIndex:self.state];
    //计算控件位置
    
    
    
}

- (void)shakePointer {
    BBAsyncRun(^{
        if (self.state == BBPullRefreshStateLoading) {
            BBMainRun(^{
            });
            if (_currentValue == 100) {
                _currentValue = 220;
            }
            else {
                _currentValue = 100;
            }
            sleep(1);
            [self performSelectorOnMainThread:@selector(shakePointer)
                                   withObject:nil
                                waitUntilDone:NO];
        }
    });
    
}

#pragma mark Views



- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 20)];
        _titleLabel.text = NSLocalizedString(@"下拉刷新...",);
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = RGBCOLOR(51, 51, 51);
    }
    return _titleLabel;
}

#pragma mark - Scroll View

- (void)resetScrollViewContentInset {
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    switch (self.position) {
        case BBPullRefreshPositionTop:
            currentInsets.top = self.originalTopInset;
            break;
        case BBPullRefreshPositionBottom:
            currentInsets.bottom = self.originalBottomInset;
            currentInsets.top = self.originalTopInset;
            break;
    }
    [self setScrollViewContentInset:currentInsets];
}

- (void)setScrollViewContentInseBBorLoading {
    CGFloat offset = MAX(self.scrollView.contentOffset.y * -1, 0);
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    switch (self.position) {
        case BBPullRefreshPositionTop:
            currentInsets.top = MIN(offset, self.originalTopInset + self.bounds.size.height);
            break;
        case BBPullRefreshPositionBottom:
            currentInsets.bottom = MIN(offset, self.originalBottomInset + self.bounds.size.height);
            break;
    }
    [self setScrollViewContentInset:currentInsets];
}

- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset {
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.scrollView.contentInset = contentInset;
                     }
                     completion:NULL];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"contentOffset"])
        [self scrollViewDidScroll:[[change valueForKey:NSKeyValueChangeNewKey] CGPointValue]];
    else if([keyPath isEqualToString:@"contentSize"]) {
        [self layoutSubviews];
        
        CGFloat yOrigin;
        switch (self.position) {
            case BBPullRefreshPositionTop:
                yOrigin = -BBRefreshViewHeight;
                break;
            case BBPullRefreshPositionBottom:
                yOrigin = MAX(self.scrollView.contentSize.height, self.scrollView.bounds.size.height);
                break;
        }
        self.frame = CGRectMake(0, yOrigin, self.bounds.size.width, BBRefreshViewHeight);
    }
    else if([keyPath isEqualToString:@"frame"])
        [self layoutSubviews];
    
}

- (void)scrollViewDidScroll:(CGPoint)contentOffset {
    if(self.state != BBPullRefreshStateLoading) {
        CGFloat scrollOffsetThreshold = 0;
        switch (self.position) {
            case BBPullRefreshPositionTop:
                scrollOffsetThreshold = self.frame.origin.y - self.originalTopInset;
                break;
            case BBPullRefreshPositionBottom:
                scrollOffsetThreshold = MAX(self.scrollView.contentSize.height - self.scrollView.bounds.size.height, 0.0f) + self.bounds.size.height + self.originalBottomInset;
                break;
        }
        if(!self.scrollView.isDragging && self.state == BBPullRefreshStateTriggered)
            self.state = BBPullRefreshStateLoading;
        else if(contentOffset.y < scrollOffsetThreshold && self.scrollView.isDragging && self.state == BBPullRefreshStateStopped && self.position == BBPullRefreshPositionTop)
            self.state = BBPullRefreshStateTriggered;
        else if(contentOffset.y >= scrollOffsetThreshold && self.state != BBPullRefreshStateStopped && self.position == BBPullRefreshPositionTop)
            self.state = BBPullRefreshStateStopped;
        else if(contentOffset.y > scrollOffsetThreshold && self.scrollView.isDragging && self.state == BBPullRefreshStateStopped && self.position == BBPullRefreshPositionBottom)
            self.state = BBPullRefreshStateTriggered;
        else if(contentOffset.y <= scrollOffsetThreshold && self.state != BBPullRefreshStateStopped && self.position == BBPullRefreshPositionBottom)
            self.state = BBPullRefreshStateStopped;
    } else {
        CGFloat offset;
        UIEdgeInsets contentInset;
        switch (self.position) {
            case BBPullRefreshPositionTop:
                offset = MAX(self.scrollView.contentOffset.y * -1, 0.0f);
                offset = MIN(offset, self.originalTopInset + self.bounds.size.height);
                contentInset = self.scrollView.contentInset;
                self.scrollView.contentInset = UIEdgeInsetsMake(offset, contentInset.left, contentInset.bottom, contentInset.right);
                break;
            case BBPullRefreshPositionBottom:
                if (self.scrollView.contentSize.height >= self.scrollView.bounds.size.height) {
                    offset = MAX(self.scrollView.contentSize.height - self.scrollView.bounds.size.height + self.bounds.size.height, 0.0f);
                    offset = MIN(offset, self.originalBottomInset + self.bounds.size.height);
                    contentInset = self.scrollView.contentInset;
                    self.scrollView.contentInset = UIEdgeInsetsMake(contentInset.top, contentInset.left, offset, contentInset.right);
                } else if (self.wasTriggeredByUser) {
                    offset = MIN(self.bounds.size.height, self.originalBottomInset + self.bounds.size.height);
                    contentInset = self.scrollView.contentInset;
                    self.scrollView.contentInset = UIEdgeInsetsMake(-offset, contentInset.left, contentInset.bottom, contentInset.right);
                }
                break;
        }
    }
}

#pragma mark - Getters

#pragma mark -

- (void)triggerRefresh {
    [self.scrollView triggerPullToRefresh];
}

- (void)startAnimating {
    switch (self.position) {
        case BBPullRefreshPositionTop:
            if(fequalzero(self.scrollView.contentOffset.y)) {
                [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, -self.frame.size.height) animated:YES];
                self.wasTriggeredByUser = NO;
            }
            else
                self.wasTriggeredByUser = YES;
            
            break;
        case BBPullRefreshPositionBottom:
            
            if((fequalzero(self.scrollView.contentOffset.y) && self.scrollView.contentSize.height < self.scrollView.bounds.size.height)
               || fequal(self.scrollView.contentOffset.y, self.scrollView.contentSize.height - self.scrollView.bounds.size.height)) {
                [self.scrollView setContentOffset:(CGPoint){.y = MAX(self.scrollView.contentSize.height - self.scrollView.bounds.size.height, 0.0f) + self.frame.size.height} animated:YES];
                self.wasTriggeredByUser = NO;
            }
            else
                self.wasTriggeredByUser = YES;
            break;
    }
    self.state = BBPullRefreshStateLoading;
    [self shakePointer];
}

- (void)stopAnimating {
    self.state = BBPullRefreshStateStopped;
    switch (self.position) {
        case BBPullRefreshPositionTop:
            if(!self.wasTriggeredByUser)
                [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, -self.originalTopInset)
                                         animated:YES];
            break;
        case BBPullRefreshPositionBottom:
            if(!self.wasTriggeredByUser)
                [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, self.scrollView.contentSize.height - self.scrollView.bounds.size.height + self.originalBottomInset)
                                         animated:YES];
            break;
    }
}

- (void)setState:(BBPullRefreshState)newState {
    
    if(_state == newState)
        return;
    
    BBPullRefreshState previousState = _state;
    _state = newState;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    switch (newState) {
        case BBPullRefreshStateAll:
        case BBPullRefreshStateStopped:
            [self resetScrollViewContentInset];
            break;
            
        case BBPullRefreshStateTriggered:
            break;
            
        case BBPullRefreshStateLoading:
            [self setScrollViewContentInseBBorLoading];
            
            if(previousState == BBPullRefreshStateTriggered && _pullToRefreshActionHandler)
                _pullToRefreshActionHandler();
            
            break;
    }
}


@end

#pragma mark - UIScrollView (BBPullRefresh)

static char UIScrollViewPullToRefreshView;

@implementation UIScrollView (BBPullRefresh)

@dynamic pullToRefreshView,showsPullToRefresh;

#pragma mark - 
#pragma mark - Actions

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler position:(BBPullRefreshPosition)position {
    
    if(!self.pullToRefreshView) {
        CGFloat yOrigin;
        switch (position) {
            case BBPullRefreshPositionTop:
                yOrigin = - BBRefreshViewHeight;
                break;
            case BBPullRefreshPositionBottom:
                yOrigin = self.contentSize.height;
                break;
            default:
                return;
        }
        CGRect frame = CGRectMake(0, yOrigin, self.bounds.size.width, BBRefreshViewHeight);
        BBTableRefreshView *view = [[BBTableRefreshView alloc] initWithFrame:frame];
        view.scrollView = self;
        view.pullToRefreshActionHandler = actionHandler;
        [self addSubview:view];
        [self sendSubviewToBack:view];
        
        view.originalTopInset    = self.contentInset.top;
        view.originalBottomInset = self.contentInset.bottom;
        view.position            = position;
        self.pullToRefreshView   = view;
        self.showsPullToRefresh  = YES;
    }
    
}
- (void)removePullToRefreshActionHandler {
    
}

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler {
    [self addPullToRefreshWithActionHandler:actionHandler position:BBPullRefreshPositionTop];
}

- (void)triggerPullToRefresh {
    self.pullToRefreshView.state = BBPullRefreshStateTriggered;
    [self.pullToRefreshView startAnimating];
}

- (void)stopPullToRefresh {
    //中断操作
    [self.pullToRefreshView stopAnimating];
}

- (void)setPullToRefreshView:(BBTableRefreshView *)pullToRefreshView {
    [self willChangeValueForKey:@"BBTableRefreshView"];
    objc_setAssociatedObject(self, &UIScrollViewPullToRefreshView,
                             pullToRefreshView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"BBTableRefreshView"];
}

- (BBTableRefreshView *)pullToRefreshView {
    return objc_getAssociatedObject(self, &UIScrollViewPullToRefreshView);
}

- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh {
    self.pullToRefreshView.hidden = !showsPullToRefresh;
    
    if(!showsPullToRefresh) {
        if (self.pullToRefreshView.isObserving) {
            [self removeObserver:self.pullToRefreshView forKeyPath:@"contentOffset"];
            [self removeObserver:self.pullToRefreshView forKeyPath:@"contentSize"];
            [self removeObserver:self.pullToRefreshView forKeyPath:@"frame"];
            [self.pullToRefreshView resetScrollViewContentInset];
            self.pullToRefreshView.isObserving = NO;
        }
    }
    else {
        if (!self.pullToRefreshView.isObserving) {
            [self addObserver:self.pullToRefreshView
                   forKeyPath:@"contentOffset"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
            
            [self addObserver:self.pullToRefreshView
                   forKeyPath:@"contentSize"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
            
            [self addObserver:self.pullToRefreshView
                   forKeyPath:@"frame"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
            
            self.pullToRefreshView.isObserving = YES;
            
            CGFloat yOrigin = 0;
            switch (self.pullToRefreshView.position) {
                case BBPullRefreshPositionTop:
                    yOrigin = -BBRefreshViewHeight;
                    break;
                case BBPullRefreshPositionBottom:
                    yOrigin = self.contentSize.height;
                    break;
            }
            self.pullToRefreshView.frame = CGRectMake(0, yOrigin, self.bounds.size.width, BBRefreshViewHeight);
        }
    }
}

- (BOOL)showsPullToRefresh {
    return !self.pullToRefreshView.hidden;
}


@end



