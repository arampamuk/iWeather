//
//  WeatherResponseWind.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseWind.h"

@implementation WeatherResponseWind

+ (WeatherResponseWind *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseWind *instance = [[WeatherResponseWind alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.deg = [aDictionary objectForKey:@"deg"];
    self.speed = [aDictionary objectForKey:@"speed"];

}

@end
