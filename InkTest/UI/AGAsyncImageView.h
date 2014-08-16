//
//  AGAsyncImageView.h
//  GamesysTest
//
//  Created by Alin Gorgan on 14/05/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AGAsyncImageLoadingStatus){
    AGAsyncImageLoadingStatusWorking,
    AGAsyncImageLoadingStatusIdle
};

@interface AGAsyncImageView : UIImageView


/********************************	Propeties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic) AGAsyncImageLoadingStatus status;


/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

/**
 Loads a new icon with the specified name
 @param iconName The icon name
 @return void
 */
-(void)loadImageWithIconName:(NSString*)iconName;

@end
