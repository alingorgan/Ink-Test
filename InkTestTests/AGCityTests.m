//
//  AGCityTests.m
//  InkTest
//
//  Created by Alin Gorgan on 16/08/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AGCity.h"

@interface AGCityTests : XCTestCase{
    AGCity* city;
}

@end

@implementation AGCityTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    city = [[AGCity alloc] initWithName:@"TestCity"];
}

- (void)tearDown
{
    city = nil;
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCityCreation
{
    XCTAssertNotNil(city, @"City cannot be nil");
}

-(void)testCityNameIsChangeable{
    NSString* newCityName = @"NewCityName";
    [city setName:newCityName];
    
    XCTAssertEqual(city.name, newCityName, @"Cannot change the city name");
}

@end
