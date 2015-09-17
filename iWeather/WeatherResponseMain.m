//
//  WeatherResponseMain.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseMain.h"

@implementation WeatherResponseMain

+ (WeatherResponseMain *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseMain *instance = [[WeatherResponseMain alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.humidity = [aDictionary objectForKey:@"humidity"];
    self.pressure = [aDictionary objectForKey:@"pressure"];
    self.temp = [aDictionary objectForKey:@"temp"];
    self.tempMax = [aDictionary objectForKey:@"temp_max"];
    self.tempMin = [aDictionary objectForKey:@"temp_min"];

}

@end
