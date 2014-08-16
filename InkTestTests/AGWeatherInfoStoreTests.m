//
//  AGWeatherInfoStoreTests.m
//  InkTest
//
//  Created by Alin Gorgan on 16/08/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AGWeatherInfoStore.h"

@interface AGWeatherInfoStoreTests : XCTestCase{
    AGWeatherInfoStore* weatherInfoStore;
}

@end

@implementation AGWeatherInfoStoreTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    weatherInfoStore = [AGWeatherInfoStore sharedStore];
}

- (void)tearDown
{
    
    weatherInfoStore = nil;
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testForValidSharedInstance
{
    XCTAssertNotNil(weatherInfoStore, @"The WeatherInfoStore shared instance cannot return nil");
}

-(void)testWeatherInfoRequestForCity{
    
    AGCity* city = [[AGCity alloc] initWithName:@"London"];
    [city setCountry:@"GB"];
    
    __block BOOL waitingForBlock = YES;
    [weatherInfoStore weatherInfoForCity:city withHandler:^(AGWeatherInfo *info) {
        
        /**  Test we get weather info  */
        XCTAssertNotNil(info, @"WeatherInfo cannot be nil, something went wrong");
        
        /**  Test it's the same city  */
        XCTAssertTrue([city isEqual:info.city], @"The cities must be identical");
        
        waitingForBlock = NO;
    }];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

@end
