//
//  WeatherResponseMain.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseMain : NSObject 

@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *temp;
@property (nonatomic, strong) NSNumber *tempMax;
@property (nonatomic, strong) NSNumber *tempMin;

+ (WeatherResponseMain *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
