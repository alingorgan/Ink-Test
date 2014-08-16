//
//  AGAsyncImageView.m
//  GamesysTest
//
//  Created by Alin Gorgan on 14/05/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGAsyncImageView.h"

#import "NHRequest.h"
#import "RequestConductor.h"
#import "NSDate+Utils.h"

@interface AGAsyncImageView()

@property (nonatomic, strong) UIToolbar* blurView;

@end

@implementation AGAsyncImageView

/********************************	Accessors		********************************/
#pragma mark
#pragma mark Accessors

@synthesize blurView = _blurView;
@synthesize status = _status;

/********************************	Access Modifiers		********************************/
#pragma mark
#pragma mark Access Modifiers

-(UIToolbar*)blurView{
    if (!_blurView){
        _blurView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [_blurView setAlpha:0.85f];
    }
    return _blurView;
}


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self setUp];
    }
    
    return self;
}

-(id)init{
    if (self = [super init]){
        [self setUp];
    }
    
    return self;
}

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods


/**
 Makes custom preparations
 @param none
 @return void
 */
-(void)setUp{
    self.status = AGAsyncImageLoadingStatusIdle;
}

-(void)layoutSubviews{
    [self addSubview:self.blurView];
}


/**
 Loads a new icon with the specified name
 @param iconName The icon name
 @return void
 */
-(void)loadImageWithIconName:(NSString*)iconName{
    
    /**  We're busy  */
    self.status = AGAsyncImageLoadingStatusWorking;
    
    /**  remove the old image  */
    [self setImage:nil];
    
    
    /**  Request the new image  */
    NHRequest* request = [[NHRequest alloc] initWithBaseURL:@"http://openweathermap.org"];
    [request setCacheTimeoutInterval:[NSDate timeIntervalByAddingHours:3 toDate:[NSDate date]]];
    
    [request addPagePathWithName:@"img"];
    [request addPagePathWithName:@"w"];
    [request addPagePathWithName:[NSString stringWithFormat:@"%@.png", iconName]];
    
    [[RequestConductor sharedConductor] performRequest:request andCompletionBlock:^(ResponseCart **responseCart) {
        
        /**  Decode and set the image  */
        UIImage* image = [[UIImage alloc] initWithData:(*responseCart).responseData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage:image];
            
            self.status = AGAsyncImageLoadingStatusIdle;
        });
    }];
}

@end
