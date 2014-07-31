//
//  AGCityTVC.m
//  InkTest
//
//  Created by Alin Gorgan on 30/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGCityTVC.h"
#import "AGWeatherInfo.h"
#import "AGWeatherInfoStore.h"
#import "AGAsyncImageView.h"

@interface AGCityTVC ()

@property (nonatomic, strong) NSMutableArray* locationArray;

@end

@implementation AGCityTVC

/********************************	Accessors		********************************/
#pragma mark
#pragma mark Accessors

@synthesize locationArray = _locationArray;


/********************************	Access Modifiers		********************************/
#pragma mark
#pragma mark Access Modifiers

-(NSArray*)locationArray{
    if (_locationArray == nil){
        _locationArray = [NSMutableArray array];
        
        /**  Add the initial locations  */
        [_locationArray addObject:[[AGWeatherInfo alloc] initWithCity:[[AGCity alloc] initWithName:@"London"]]];
        [_locationArray addObject:[[AGWeatherInfo alloc] initWithCity:[[AGCity alloc] initWithName:@"Luton"]]];
        [_locationArray addObject:[[AGWeatherInfo alloc] initWithCity:[[AGCity alloc] initWithName:@"Manchester"]]];
        [_locationArray addObject:[[AGWeatherInfo alloc] initWithCity:[[AGCity alloc] initWithName:@"Birmingham"]]];
    }
    
    return _locationArray;
}

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self prepareUI];
}


/**
 Prepares the UI
 @param none
 @return void
 */
-(void)prepareUI{
    
    /**  Add the segmented control above the list view  */
    UISegmentedControl* sortControl = [[UISegmentedControl alloc] initWithItems:@[@"Temperature ascending", @"Temperature descending"]];
    [sortControl setCenter:CGPointMake(self.view.frame.size.width/2, -20)];
    [sortControl setSelectedSegmentIndex:0];
    [sortControl addTarget:self action:@selector(selectionChangedInSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:sortControl];
    
    
    [self.tableView setContentInset:UIEdgeInsetsMake(50, 0, 0, 0)];
}

/********************************	UITableViewDatasource methods		********************************/
#pragma mark
#pragma mark UITableViewDatasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.locationArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    AGWeatherInfo* weatherInfo = [self.locationArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:weatherInfo.city.name];
    
    /**  If the temperature is 0, we haven't loaded any weather info for the current city  */
    if (weatherInfo.temperature == 0){
        [[AGWeatherInfoStore sharedStore] weatherInfoForCity:weatherInfo.city
                                                 withHandler:^(AGWeatherInfo *info) {
                                     
             /** Store the new object  */
             [self.locationArray replaceObjectAtIndex:indexPath.row withObject:info];
            
             [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
             
                                                     
             /**  Figure if all the cities have weather information, so we ca trigger the sort process  */
             BOOL shouldSort = YES;
             for (AGWeatherInfo* weatherInfo in self.locationArray){
                 if (weatherInfo.temperature == 0){
                     shouldSort = NO;
                     break;
                 }
             }
             if (shouldSort){
                 /**  Sort  */
                 NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"temperature"
                                                                                  ascending:YES
                                                                                   selector:@selector(compare:)];
                 [self.locationArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
                 
                 [self.tableView reloadData];
             }
                                                     
        }];
        [cell.detailTextLabel setText:@""];
    }
    else{
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d°", weatherInfo.temperature]];
    }
    
    return cell;
}

/********************************	UITableViewDelegate Methods		********************************/
#pragma mark
#pragma mark UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /**  Send back the response  */
    [self.delegate didSelectWeatherInfo:[self.locationArray objectAtIndex:indexPath.row]];
}

/********************************	Event Handlers		********************************/
#pragma mark
#pragma mark Event Handlers

- (IBAction)cancelButtonTouched:(id)sender {
    /**  Send back the response  */
    [self.delegate didSelectWeatherInfo:nil];
}

/**
 Handler for the segmented control value changed action
 @param sender The segmented control who's value has changed
 @return void
 */
-(void)selectionChangedInSegmentedControl:(UISegmentedControl*)sender{
    /**  Sort using the selected segment index  */
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"temperature"
                                                                     ascending:sender.selectedSegmentIndex == 0 ? YES : NO
                                                                      selector:@selector(compare:)];
    [self.locationArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    [self.tableView reloadData];
}

/********************************	Rotation event handlers		********************************/
#pragma mark
#pragma mark Rotation event handlers

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
