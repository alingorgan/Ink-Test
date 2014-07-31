//
//  AGWeatherInfoParser.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AGWeatherInfo.h"

@interface AGWeatherInfoParser : NSObject

/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 Creates a new class instance
 @param data The weather information data
 @return The new class instance
 */
-(id)initWithData:(NSData*)data;


/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

/**
 Parses the weather info data
 @param none
 @return The new AGWeatherInfo object
 */
-(AGWeatherInfo*)parseWeatherInfo;

@end
