//
//  WeatherResponseClouds.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseClouds : NSObject  

@property (nonatomic, strong) NSNumber *all;

+ (WeatherResponseClouds *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
