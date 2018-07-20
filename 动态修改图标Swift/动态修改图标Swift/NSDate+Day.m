//
//  NSDate+Day.m
//  动态修改图标Swift
//
//  Created by guxiangyun on 2018/7/20.
//  Copyright © 2018年 chenran. All rights reserved.
//

#import "NSDate+Day.h"

@implementation NSDate (Day)

- (NSUInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:self];
#endif
    return [dayComponents day];
}

@end
