//
//  AGViewController.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGViewController.h"

#import "AGWeatherInfoStore.h"
#import "AGAsyncImageView.h"
#import "AGCityTVC.h"

@interface AGViewController () <AGCityTVCDelegate>

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (weak, nonatomic) IBOutlet UIView *temperatureView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@property (weak, nonatomic) IBOutlet UILabel *weatherConditionsLabel;
@property (weak, nonatomic) IBOutlet AGAsyncImageView *weatherIconView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureRangeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;

@end

@implementation AGViewController

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self prepareUI];
    [self loadUIData];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    /**  Subscribe to location changes to update the current view  */
    UINavigationController* navController = segue.destinationViewController;
    AGCityTVC* cityTVC = (AGCityTVC*)navController.viewControllers[0];
    [cityTVC setDelegate:self];
}


/**
 Customizes and prepares the current view
 @param none
 @return void
 */
-(void)prepareUI{

    [self.temperatureView setBackgroundColor:[UIColor clearColor]];
    
    /**  Draw the temperature round rect  */
    [self.temperatureView.layer setBorderColor:[UIColor darkGrayColor].CGColor];
    [self.temperatureView.layer setBorderWidth:0.5f];
    [self.temperatureView.layer setCornerRadius:60.0f];
}


/**
 Loads the initial data the first time the view is presented
 @param none
 @return void
 */
-(void)loadUIData{
    AGCity* city = [[AGCity alloc] initWithName:@"London"];
    [[AGWeatherInfoStore sharedStore] weatherInfoForCity:city
                                             withHandler:^(AGWeatherInfo *info) {
                                                 
                                                 [self populateUIWithWeatherInfo:info];
                                                 
                                             }];
}


/**
 Populates the UI controls with weather data
 @param info A WeatherInfo object containing weather information
 @return void
 */
-(void)populateUIWithWeatherInfo:(AGWeatherInfo*)info{
    
    [self.weatherConditionsLabel setText:info.weatherCondition.description];
    
    [self.weatherIconView loadImageWithIconName:info.weatherCondition.iconName];
    
    [self.temperatureLabel setText:[NSString stringWithFormat:@"%d", info.temperature]];
    [self.temperatureRangeLabel setText:[NSString stringWithFormat:@"Today: %d° / %d°", info.minTemperature, info.maxTemperature]];
    
    [self.pressureLabel setText:[NSString stringWithFormat:@"Pressure: %d", info.pressure]];
    [self.humidityLabel setText:[NSString stringWithFormat:@"Humidity: %d", info.humidity]];
    
    
    /**  Add a custom title to the navigation bar  */
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    [titleLabel setTextColor:[UIColor darkGrayColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:25]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:info.city.name];
    [titleView addSubview:titleLabel];
    
    UILabel* coordinatesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 150, 10)];
    [coordinatesLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [coordinatesLabel setTextAlignment:NSTextAlignmentCenter];
    [coordinatesLabel setTextColor:[UIColor darkGrayColor]];
    [coordinatesLabel setText:[NSString stringWithFormat:@"%f, %f", info.city.coordinates.latitude, info.city.coordinates.longitude]];
    [titleView addSubview:coordinatesLabel];
    
    self.navigationItem.titleView = titleView;
}


/********************************	AGCityTVCDelegate Methods		********************************/
#pragma mark
#pragma mark AGCityTVCDelegate Methods

-(void)didSelectWeatherInfo:(AGWeatherInfo *)weatherInfo{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (weatherInfo){
        [self populateUIWithWeatherInfo:weatherInfo];
    }
}

/********************************	Screen rotation handlers		********************************/
#pragma mark
#pragma mark Screen rotation handlers

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return UIInterfaceOrientationPortrait;
}


@end
