//
//  WeatherResponseClouds.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponseClouds.h"

@implementation WeatherResponseClouds

+ (WeatherResponseClouds *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponseClouds *instance = [[WeatherResponseClouds alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.all = [aDictionary objectForKey:@"all"];

}

@end
