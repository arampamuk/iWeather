//
//  WeatherResponseSys.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseSys.h"

@implementation WeatherResponseSys

+ (WeatherResponseSys *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseSys *instance = [[WeatherResponseSys alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.country = [aDictionary objectForKey:@"country"];
    self.weatherResponseSysId = [aDictionary objectForKey:@"id"];
    self.message = [aDictionary objectForKey:@"message"];
    self.sunrise = [aDictionary objectForKey:@"sunrise"];
    self.sunset = [aDictionary objectForKey:@"sunset"];
    self.type = [aDictionary objectForKey:@"type"];

}

@end
