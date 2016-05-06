//
//  GuideHelpView.h
//  BBFoundation
//
//  Created by Gary on 5/4/16.
//  Copyright © 2016 Gary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMHoledView.h"

@class ViewGuideModel;

@protocol GuideHelpViewDelegate <NSObject>

@optional

- (void)holedView:(JMHoledView *)holedView didSelectHoleAtIndex:(NSUInteger)index;

@end

@interface GuideHelpView : UIView

@property (nonatomic, weak) id<GuideHelpViewDelegate> delegate;
@property (nonatomic, assign) NSInteger holeIndex;

-(void) refreshGuide:(ViewGuideModel *)model inview:(id)sender;

@end
