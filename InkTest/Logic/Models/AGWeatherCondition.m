//
//  AGWeatherCondition.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGWeatherCondition.h"

@implementation AGWeatherCondition

/********************************	Accessors		********************************/
#pragma mark
#pragma mark Accessors

@synthesize conditionCode = _conditionCode;
@synthesize description = _description;
@synthesize iconName = _iconName;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 Creates a new class instance
 @param conditionCode The weather condition code
 @return The new class instance
 */
-(id)initWithConditionCode:(NSInteger)conditionCode{
    if (self = [super init]){
        _conditionCode = conditionCode;
    }
    
    return self;
}

@end
