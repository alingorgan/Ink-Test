//
//  NSDate+Utils.h
//  NetworkHelper
//
//  Created by Gorgan Alin on 12/3/13.
//  Copyright (c) 2013 Gorgan Alin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)


/********************************	Static Methods		********************************/
#pragma mark
#pragma mark Static Methods

+(NSTimeInterval)timeIntervalByAddingMinutes:(NSInteger)minutes toDate:(NSDate*)date;
+(NSTimeInterval)timeIntervalByAddingHours:(NSInteger)hours toDate:(NSDate*)date;
+(NSTimeInterval)timeIntervalByAddingDays:(NSInteger)days toDate:(NSDate*)date;

@end
