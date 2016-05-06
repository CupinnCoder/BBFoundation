//
//  NSDate+BBCore.h
//  BBFoundation
//
//  Created by Gary on 3/30/16.
//  Copyright © 2016 BBFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDate (BBCore)

@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger quarter; ///< Quarter component
@property (nonatomic, readonly) BOOL isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL isYesterday; ///< whether date is yesterday (based on current locale)

- (nullable NSDate *)bb_dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)bb_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)bb_dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)bb_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)bb_dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)bb_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)bb_dateByAddingSeconds:(NSInteger)seconds;


- (nullable NSString *)bb_stringWithFormat:(NSString *)format;

- (nullable NSString *)bb_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;
- (nullable NSString *)bb_stringWithISOFormat;
+ (nullable NSDate *)bb_dateWithString:(NSString *)dateString format:(NSString *)format;
+ (nullable NSDate *)bb_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;
+ (nullable NSDate *)bb_dateWithISOFormatString:(NSString *)dateString;

@end
NS_ASSUME_NONNULL_END