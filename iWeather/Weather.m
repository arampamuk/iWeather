//
//  Weather.m
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import "Weather.h"

@implementation Weather



+ (Weather *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Weather *instance = [[Weather alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.descriptionText = [aDictionary objectForKey:@"description"];
    self.icon = [aDictionary objectForKey:@"icon"];
    
    self.iconUrl = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", self.icon];
    
    self.weatherId = [aDictionary objectForKey:@"id"];
    self.main = [aDictionary objectForKey:@"main"];

}

@end
