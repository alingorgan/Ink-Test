//
//  RequestConductor.h
//  RequestCacher
//
//  Created by Alin Gorgan on 1/28/13.
//  Copyright (c) 2013 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NHRequest.h"
#import "ResponseCart.h"

@interface RequestConductor : NSObject

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods
-(NSInteger)performRequest:(NHRequest*)request
        andCompletionBlock:(void (^)(ResponseCart **))completionBlock;

+(RequestConductor*)sharedConductor;

@end
