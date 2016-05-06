//
//  BBDefaultStyle.h
//  BBProject
//
//  Created by Gary on 5/26/15.
//  Copyright (c) 2014 Gary. All rights reserved.
//

#import "BBStyle.h"

@interface BBDefaultStyle : BBStyle

/////////////////////////////////////////////全局字体格式定义//////////////////////////////////////////

@property (nonatomic ,readonly) UIFont *font10;
@property (nonatomic ,readonly) UIFont *font10B;

@property (nonatomic ,readonly) UIFont *font12;
@property (nonatomic ,readonly) UIFont *font12B;

@property (nonatomic ,readonly) UIFont *font14;
@property (nonatomic ,readonly) UIFont *font14B;

@property (nonatomic ,readonly) UIFont *font16;
@property (nonatomic ,readonly) UIFont *font16B;

@property (nonatomic ,readonly) UIFont *font18;
@property (nonatomic ,readonly) UIFont *font18B;

/////////////////////////////////////////////全局颜色定义//////////////////////////////////////////

@property (nonatomic ,readonly) UIColor *viewBackgroundColor;

@property (nonatomic ,readonly) UIColor *navBarBackgroundColor;

@property (nonatomic ,readonly) UIFont  *navBarTitleFont;

@property (nonatomic ,readonly) UIColor *navBarTitleColor;


/////////////////////////////////////////////HUD提示-START//////////////////////////////////////////
@property (nonatomic ,readonly) UIFont  *loadingTexBBont;
@property (nonatomic ,readonly) UIColor *loadingTextColor;
@property (nonatomic ,readonly) UIColor *loadingLineColor;
/////////////////////////////////////////////HUD提示-END////////////////////////////////////////////



///////////////////////////////////////////AlertView样式定义/////////////////////////////////////////
@property (nonatomic ,readonly) UIColor *alertCancelColor;
@property (nonatomic ,readonly) UIColor *alertCancelHColor;
@property (nonatomic ,readonly) UIColor *alertOKColor;
@property (nonatomic ,readonly) UIColor *alertOKHColor;
@property (nonatomic ,readonly) UIColor *alertLineColor;
@property (nonatomic ,readonly) UIColor *alertTitleColor;
@property (nonatomic ,readonly) UIColor *alertContentColor;

//下载
@property (nonatomic ,readonly) UIColor* downloadProgressColor;
@property (nonatomic ,readonly) UIColor* downloadBgColor;

@end
