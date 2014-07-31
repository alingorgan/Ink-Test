//
//  AGCity.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AGCity : NSObject

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic, strong) NSString* name;
@property (nonatomic) CLLocationCoordinate2D coordinates;
@property (nonatomic, strong) NSString* country;

/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 The class intializer
 @param name The new city name
 @return The new class instance
 */
-(id)initWithName:(NSString*)name;

@end
