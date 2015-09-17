//
//  WeatherResponseCoord.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseCoord.h"

@implementation WeatherResponseCoord

+ (WeatherResponseCoord *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseCoord *instance = [[WeatherResponseCoord alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.lat = [aDictionary objectForKey:@"lat"];
    self.lon = [aDictionary objectForKey:@"lon"];

}

@end
