//
//  NHRequest.h
//  NetworkHelper
//
//  Created by Gorgan Alin on 11/5/13.
//  Copyright (c) 2013 Gorgan Alin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum HTTPMethod{
    HTTPGet = 0,
    HTTPPost = 1
} HTTPMethod;

@interface NHRequest : NSObject

/********************************	Properties		********************************/
#pragma mark
#pragma mark Properties
@property (nonatomic, strong) NSString* baseUrl;
@property (nonatomic, strong) NSString* fullURL;
@property (nonatomic, strong) NSMutableArray* pagePaths;
@property (nonatomic, strong) NSMutableDictionary* params;
@property (nonatomic) NSTimeInterval cacheTimeoutInterval;
@property (nonatomic) NSTimeInterval timeoutInterval;
@property (nonatomic) BOOL shouldInvalidateCacheOnExpiry;
@property (nonatomic, readonly) NSNumber* hash;

@property (nonatomic) HTTPMethod httpMethod;
@property (nonatomic, strong, readonly) NSString* httpMethodString;
@property (nonatomic, strong, readonly) NSString* httpBody;
@property (nonatomic, strong, readonly) NSString* pagePathsString;
@property (nonatomic, strong) NSMutableDictionary* allHttpHeaderFields;


/********************************	Methods		********************************/
#pragma mark
#pragma mark Methods
-(NSURLRequest*)urlRequest;


/********************************	Initializers		********************************/
#pragma mark
#pragma mark Initializers
-(id)initWithBaseURL:(NSString*)baseURL;
+(id)requestWithBaseURL:(NSString*)baseURL pagePaths:(NSArray*)pagePaths andParams:(NSDictionary*)params;
+(id)requestWithURL:(NSURL*)url;


/********************************	Page Path Management		********************************/
#pragma mark
#pragma mark Page Path Management
-(void)addPagePathWithName:(NSString*)pageName;
-(NSInteger)indexOfPagePath:(NSString*)pageName;
-(void)removePagePathWithIndex:(NSInteger)pagePathIndex;
-(void)insertPagePathWithName:(NSString*)pagePathName atIndex:(NSInteger)pagePathIndex;

/********************************	Param Management		********************************/
#pragma mark
#pragma mark Param Management
-(void)setParamWithName:(NSString*)paramName andValue:(NSString*)paramValue;
-(void)removeParamWithName:(NSString*)paramName;

@end
