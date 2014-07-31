//
//  AGWeatherInfoParser.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGWeatherInfoParser.h"

#import "TBXML.h"

@interface AGWeatherInfoParser()

@property (nonatomic, strong) TBXML* parser;

@end

@implementation AGWeatherInfoParser

/********************************	Intializers		********************************/
#pragma mark
#pragma mark Intializers

/**
 Creates a new class instance
 @param data The weather information data
 @return The new class instance
 */
-(id)initWithData:(NSData*)data{
    if (self = [super init]){
        NSError* error = nil;
        _parser = [[TBXML alloc] initWithXMLData:data error:&error];
        
        if (error){
            NSLog(@"Error parsing data: %@", error.description);
        }
    }
    
    return self;
}

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

/**
 Parses the weather info data
 @param none
 @return The new AGWeatherInfo object
 */
-(AGWeatherInfo*)parseWeatherInfo{
    AGWeatherInfo* info = nil;
    AGCity* city = nil;
    
    if (!self.parser){
        return info;
    }
    
    /**  Parce the city element  */
    TBXMLElement* cityElement = [TBXML childElementNamed:@"city" parentElement:self.parser.rootXMLElement];
    if (cityElement != nil){
        
        NSString* cityName = [TBXML valueOfAttributeNamed:@"name" forElement:cityElement];
        city = [[AGCity alloc] initWithName:cityName];
        
        TBXMLElement* coordElement = [TBXML childElementNamed:@"coord" parentElement:cityElement];
        if (coordElement != nil){
            NSString* longitude = [TBXML valueOfAttributeNamed:@"lon" forElement:coordElement];
            NSString* latitude = [TBXML valueOfAttributeNamed:@"lat" forElement:coordElement];
            
            if (latitude != nil && longitude != nil){
                [city setCoordinates:CLLocationCoordinate2DMake(latitude.doubleValue, longitude.doubleValue)];
            }
            
        }
        
        TBXMLElement* countryElement = [TBXML childElementNamed:@"country" parentElement:cityElement];
        if (countryElement != nil){
            NSString* country = [TBXML textForElement:countryElement];
            if (country != nil){
                [city setCountry:country];
            }
        }
    }
    else{
        return info;
    }
    
    info = [[AGWeatherInfo alloc] initWithCity:city];
    [info setCity:city];
    
    /**  Get the temperature  */
    TBXMLElement* temperatureElement = [TBXML childElementNamed:@"temperature" parentElement:self.parser.rootXMLElement];
    if (temperatureElement != nil){
        NSString* temperature = [TBXML valueOfAttributeNamed:@"value" forElement:temperatureElement];
        if (temperature != nil){
            double temperatureValue = temperature.doubleValue - 273.15;
            [info setTemperature:(int)temperatureValue];
        }
        
        NSString* minTemperature = [TBXML valueOfAttributeNamed:@"min" forElement:temperatureElement];
        NSString* maxTemperature = [TBXML valueOfAttributeNamed:@"max" forElement:temperatureElement];
        
        if (minTemperature != nil && maxTemperature != nil){
            [info setMinTemperature:minTemperature.intValue - 273.15];
            [info setMaxTemperature:maxTemperature.intValue - 273.15];
        }
    }
    
    /**  Get the humidity  */
    TBXMLElement* humidityElement = [TBXML childElementNamed:@"humidity" parentElement:self.parser.rootXMLElement];
    if (humidityElement != nil){
        NSString* humidity = [TBXML valueOfAttributeNamed:@"value" forElement:humidityElement];
        if (humidity != nil){
            [info setHumidity:humidity.intValue];
        }
    }
    
    /**  Get the pressure  */
    TBXMLElement* pressureElement = [TBXML childElementNamed:@"pressure" parentElement:self.parser.rootXMLElement];
    if (pressureElement != nil){
        NSString* pressure = [TBXML valueOfAttributeNamed:@"value" forElement:pressureElement];
        if (pressure != nil){
            [info setPressure:pressure.intValue];
        }
    }
    
    /**  Get the weather condition, description and icon name  */
    TBXMLElement* weatherElement = [TBXML childElementNamed:@"weather" parentElement:self.parser.rootXMLElement];
    if (weatherElement != nil){
        NSString* conditionCode = [TBXML valueOfAttributeNamed:@"number" forElement:weatherElement];
        NSString* description = [TBXML valueOfAttributeNamed:@"value" forElement:weatherElement];
        NSString* iconName = [TBXML valueOfAttributeNamed:@"icon" forElement:weatherElement];
        
        AGWeatherCondition* condition = [[AGWeatherCondition alloc] initWithConditionCode:conditionCode.intValue];
        [condition setDescription:description];
        [condition setIconName:iconName];
        
        [info setWeatherCondition:condition];
    }
    
    return info;
}

@end
