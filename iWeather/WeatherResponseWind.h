//
//  WeatherResponseWind.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseWind : NSObject  

@property (nonatomic, strong) NSNumber *deg;
@property (nonatomic, strong) NSNumber *speed;

+ (WeatherResponseWind *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
