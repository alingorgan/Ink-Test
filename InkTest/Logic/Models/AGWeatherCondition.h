//
//  AGWeatherCondition.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGWeatherCondition : NSObject

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic) NSInteger conditionCode;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* iconName;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

/**
 Creates a new class instance
 @param conditionCode The weather condition code
 @return The new class instance
 */
-(id)initWithConditionCode:(NSInteger)conditionCode;

@end
