//
//  AGAsyncImageViewTests.m
//  InkTest
//
//  Created by Alin Gorgan on 16/08/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AGAsyncImageView.h"

@interface AGAsyncImageViewTests : XCTestCase

@end

@implementation AGAsyncImageViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testImageHasBeenLoadedSuccessfully{
    
    /**  Setup the image view and request the new image  */
    AGAsyncImageView* imageView = [[AGAsyncImageView alloc] init];
    [imageView loadImageWithIconName:@"02d"];
    
    /**  Wait for the request to finish loading  */
    while (imageView.status == AGAsyncImageLoadingStatusWorking) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    /**  Check if uppon completion, the image has been loaded.  */
    if (imageView.status == AGAsyncImageLoadingStatusIdle){
        XCTAssertFalse(imageView.image == nil, @"The there is an error loading the image");
    }
}

@end
