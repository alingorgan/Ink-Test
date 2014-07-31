//
//  AGWeatherInfo.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGWeatherInfo.h"

@implementation AGWeatherInfo

/********************************	Accessors		********************************/
#pragma mark
#pragma mark Accessors

@synthesize city = _city;
@synthesize weatherCondition = _weatherCondition;

@synthesize temperature = _temperature;
@synthesize minTemperature = _minTemperature;
@synthesize maxTemperature = _maxTemperature;
@synthesize pressure = _pressure;
@synthesize humidity = _humidity;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 The class initializer
 @param city The AGCity object
 @return The new class instance
 */
-(id)initWithCity:(AGCity*)city{
    if (self = [super init]){
        _city = city;
    }
    
    return self;
}

@end
