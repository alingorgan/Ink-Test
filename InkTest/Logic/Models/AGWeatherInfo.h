//
//  AGWeatherInfo.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AGCity.h"
#import "AGWeatherCondition.h"

@interface AGWeatherInfo : NSObject

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic, strong) AGCity* city;
@property (nonatomic, strong) AGWeatherCondition* weatherCondition;

@property (nonatomic) NSInteger temperature;
@property (nonatomic) NSInteger minTemperature;
@property (nonatomic) NSInteger maxTemperature;
@property (nonatomic) NSInteger humidity;
@property (nonatomic) NSInteger pressure;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 The class initializer
 @param city The AGCity object
 @return The new class instance
 */
-(id)initWithCity:(AGCity*)city;

@end
