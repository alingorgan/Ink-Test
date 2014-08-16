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

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

-(BOOL)isEqual:(id)object{
    
    if (![object isKindOfClass:[self class]]){
        return NO;
    }
    
    AGCity* tempCity = (AGCity*)object;
    if (![self.name isEqualToString:tempCity.name]){
        return NO;
    }
    
    if (!(round(self.coordinates.latitude * 1000.0) == round(self.coordinates.latitude * 1000.0)
        && round(tempCity.coordinates.longitude * 1000.0) == round(tempCity.coordinates.longitude * 1000.0))) {
        // coordinates are not equal
        return NO;
        
    }
    
    if (![self.country isEqualToString:tempCity.country]){
        return NO;
    }
    
    return YES;
}

@end
