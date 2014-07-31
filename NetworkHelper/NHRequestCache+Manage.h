//
//  NHRequestCache+Manage.h
//  NetworkHelper
//
//  Created by Gorgan Alin on 11/14/13.
//  Copyright (c) 2013 Gorgan Alin. All rights reserved.
//

#import "NHRequestCache.h"
#import "NHRequest.h"

@interface NHRequestCache (Manage)

/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods

+(NHRequestCache*)cachedRequestWithRequest:(NHRequest*)request withContext:(NSManagedObjectContext*)context;
+(BOOL)cacheRequest:(NHRequest*)request withData:(NSData*)responseData andManagedObjectContext:(NSManagedObjectContext*)context;
+(void)removeCachedRequest:(NHRequestCache*)cachedRequest withManagedObjectContext:(NSManagedObjectContext*)context;

-(BOOL)isExpired;

@end
