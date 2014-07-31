//
//  ResponseCart.h
//  RequestCacher
//
//  Created by Gorgan Alin on 2/1/13.
//  Copyright (c) 2013 Alin Gorgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NHRequestCache+Manage.h"

@interface ResponseCart : NSObject

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties

@property (nonatomic, readonly) NSInteger ticket;
@property (nonatomic, readonly, strong) NSData* responseData;
@property (nonatomic, readonly) BOOL retrievedFromCache;
@property (nonatomic) BOOL shouldFetchLatestData;
@property (nonatomic) BOOL shouldCache;
@property (nonatomic, readonly) BOOL isExpired;
@property (nonatomic) NSTimeInterval cacheTimeout;

/********************************	Initializer		********************************/
#pragma mark
#pragma mark Initializer
-(id)initWithTicket:(NSInteger)requestTicket andResponseData:(NSData*)downloadedData withCachedRequest:(NHRequestCache*)cachedRequest;

@end
