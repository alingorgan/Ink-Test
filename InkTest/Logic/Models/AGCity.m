//
//  AGCity.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGCity.h"

@implementation AGCity

/********************************	Accessors		********************************/
#pragma mark
#pragma mark Accessors

@synthesize name = _name;
@synthesize coordinates = _coordinates;
@synthesize country = _country;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 The class intializer
 @param name The new city name
 @return The new class instance
 */
-(id)initWithName:(NSString*)name{
    if (self = [super init]){
        _name = name;
    }
    
    return self;
}

@end
