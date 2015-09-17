//
//  WeatherResponseCoord.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseCoord : NSObject  

@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *lon;

+ (WeatherResponseCoord *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
