//
//  AGWeatherInfoStore.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGWeatherInfoStore.h"

#import "NHRequest.h"
#import "NSDate+Utils.h"
#import "RequestConductor.h"

#import "TBXML.h"
#import "AGWeatherInfoParser.h"

@implementation AGWeatherInfoStore

/**
 Creates and returns a shared instance of the current store
 @param none
 @return The AGWeatherInfoStore shared instance
 */
+(AGWeatherInfoStore*)sharedStore{
    static AGWeatherInfoStore* weatherInfoStore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weatherInfoStore = [[AGWeatherInfoStore alloc] init];
    });
    
    return weatherInfoStore;
}

/**
 Requests weather information updates for the current city
 @param city The AGCity object used to retrieve weather information
 @param handler A block which serves as a completion handler
 @return void
 */
-(void)weatherInfoForCity:(AGCity*)city withHandler:(void(^)(AGWeatherInfo* info))handler{
    
    /**  Creates a new request for weather information  */
    NHRequest* request = [[NHRequest alloc] initWithBaseURL:@"http://api.openweathermap.org/"];
    [request setCacheTimeoutInterval:[NSDate timeIntervalByAddingMinutes:1 toDate:[NSDate date]]];
    [request setHttpMethod:HTTPGet];
    
    [request addPagePathWithName:@"data"];
    [request addPagePathWithName:@"2.5"];
    [request addPagePathWithName:@"weather"];
    
    [request setParamWithName:@"q" andValue:city.name];
    [request setParamWithName:@"mode" andValue:@"xml"];
   
    [[RequestConductor sharedConductor] performRequest:request andCompletionBlock:^(ResponseCart **responseCart) {
        
        AGWeatherInfo* weatherInfo = nil;
        if ((*responseCart).responseData != nil){
            /**  Parse the info  */
            AGWeatherInfoParser* parser = [[AGWeatherInfoParser alloc] initWithData:(*responseCart).responseData];
            weatherInfo = [parser parseWeatherInfo];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            handler(weatherInfo);
        });
        
    }];
}


@end
