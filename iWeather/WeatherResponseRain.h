//
//  WeatherResponseRain.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseRain : NSObject {
    NSNumber *threeH;
}

@property (nonatomic, strong) NSNumber *threeHh;

+ (WeatherResponseRain *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
