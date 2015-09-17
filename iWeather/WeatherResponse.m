//
//  WeatherResponse.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "WeatherResponse.h"

#import "WeatherResponseClouds.h"
#import "WeatherResponseCoord.h"
#import "WeatherResponseMain.h"
#import "WeatherResponseRain.h"
#import "WeatherResponseSys.h"
#import "Weather.h"
#import "WeatherResponseWind.h"

@implementation WeatherResponse


 

+ (WeatherResponse *)instanceFromDictionary:(NSDictionary *)aDictionary {

    WeatherResponse *instance = [[WeatherResponse alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.base = [aDictionary objectForKey:@"base"];
    self.clouds = [WeatherResponseClouds instanceFromDictionary:[aDictionary objectForKey:@"clouds"]];
    self.cod = [aDictionary objectForKey:@"cod"];
    self.coord = [WeatherResponseCoord instanceFromDictionary:[aDictionary objectForKey:@"coord"]];
    self.dt = [aDictionary objectForKey:@"dt"];
    self.weatherResponseId = [aDictionary objectForKey:@"id"];
    self.main = [WeatherResponseMain instanceFromDictionary:[aDictionary objectForKey:@"main"]];
    self.name = [aDictionary objectForKey:@"name"];
    self.rain = [WeatherResponseRain instanceFromDictionary:[aDictionary objectForKey:@"rain"]];
    self.sys = [WeatherResponseSys instanceFromDictionary:[aDictionary objectForKey:@"sys"]];

    NSArray *receivedWeather = [aDictionary objectForKey:@"weather"];
    if ([receivedWeather isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedWeather = [NSMutableArray arrayWithCapacity:[receivedWeather count]];
        for (NSDictionary *item in receivedWeather) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedWeather addObject:[Weather instanceFromDictionary:item]];
            }
        }

        self.weather = populatedWeather;

    }
    self.wind = [WeatherResponseWind instanceFromDictionary:[aDictionary objectForKey:@"wind"]];

}



@end
