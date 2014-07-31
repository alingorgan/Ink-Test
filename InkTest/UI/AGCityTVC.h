//
//  AGCityTVC.h
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AGWeatherInfo.h"

@protocol AGCityTVCDelegate;

@interface AGCityTVC : UITableViewController

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic, weak) id<AGCityTVCDelegate> delegate;

@end


/********************************	Protocols		********************************/
#pragma mark
#pragma mark Protocols

@protocol AGCityTVCDelegate <NSObject>

@required

-(void)didSelectWeatherInfo:(AGWeatherInfo*)weatherInfo;

@end
