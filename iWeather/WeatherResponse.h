//
//  WeatherResponse.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherResponseClouds;
@class WeatherResponseCoord;
@class WeatherResponseMain;
@class WeatherResponseRain;
@class WeatherResponseSys;
@class WeatherResponseWind;

@interface WeatherResponse : NSObject  

@property (nonatomic, strong) NSString *base;
@property (nonatomic, strong) WeatherResponseClouds *clouds;
@property (nonatomic, strong) NSNumber *cod;
@property (nonatomic, strong) WeatherResponseCoord *coord;
@property (nonatomic, strong) NSNumber *dt;
@property (nonatomic, strong) NSNumber *weatherResponseId;
@property (nonatomic, strong) WeatherResponseMain *main;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) WeatherResponseRain *rain;
@property (nonatomic, strong) WeatherResponseSys *sys;
@property (nonatomic, strong) NSArray *weather;
@property (nonatomic, strong) WeatherResponseWind *wind;

+ (WeatherResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
