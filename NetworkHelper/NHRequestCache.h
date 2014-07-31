//
//  NHRequestCache.h
//  NetworkHelper
//
//  Created by Alin Gorgan on 26/03/14.
//  Copyright (c) 2014 Gorgan Alin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NHParam, NHRequestHeader;

@interface NHRequestCache : NSManagedObject

@property (nonatomic, retain) NSDate * expiryDate;
@property (nonatomic, retain) NSString * httpMethod;
@property (nonatomic, retain) NSString * pagePaths;
@property (nonatomic, retain) NSString * responseFilePath;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *httpHeaderFields;
@property (nonatomic, retain) NSSet *params;
@end

@interface NHRequestCache (CoreDataGeneratedAccessors)

- (void)addHttpHeaderFieldsObject:(NHRequestHeader *)value;
- (void)removeHttpHeaderFieldsObject:(NHRequestHeader *)value;
- (void)addHttpHeaderFields:(NSSet *)values;
- (void)removeHttpHeaderFields:(NSSet *)values;

- (void)addParamsObject:(NHParam *)value;
- (void)removeParamsObject:(NHParam *)value;
- (void)addParams:(NSSet *)values;
- (void)removeParams:(NSSet *)values;

@end
