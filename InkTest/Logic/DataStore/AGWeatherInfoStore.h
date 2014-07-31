//
//  AGWeatherInfoStore.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGWeatherInfo.h"

@interface AGWeatherInfoStore : NSObject

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

/**
 Creates and returns a shared instance of the current store
 @param none
 @return The AGWeatherInfoStore shared instance
 */
+(AGWeatherInfoStore*)sharedStore;


/**
 Requests weather information updates for the current city
 @param city The AGCity object used to retrieve weather information
 @param handler A block which serves as a completion handler
 @return void
 */
-(void)weatherInfoForCity:(AGCity*)city withHandler:(void(^)(AGWeatherInfo* info))handler;

@end
