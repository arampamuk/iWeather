//
//  WeatherResponseRain.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseRain.h"

@implementation WeatherResponseRain

+ (WeatherResponseRain *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseRain *instance = [[WeatherResponseRain alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.threeHh = [aDictionary objectForKey:@"3h"];

}

@end
