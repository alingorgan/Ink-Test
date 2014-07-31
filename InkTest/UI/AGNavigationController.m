//
//  AGNavigationController.m
//  InkTest
//
//  Created by Alin Gorgan on 31/07/14.
//  Copyright (c) 2014 Alin Gorgan. All rights reserved.
//

#import "AGNavigationController.h"

@implementation AGNavigationController

/********************************	Rotation event handlers		********************************/
#pragma mark
#pragma mark Rotation event handlers

-(BOOL)shouldAutorotate {
    return [[self.viewControllers lastObject] shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


@end
