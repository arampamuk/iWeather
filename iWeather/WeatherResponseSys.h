//
//  WeatherResponseSys.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseSys : NSObject  

@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSNumber *weatherResponseSysId;
@property (nonatomic, strong) NSNumber *message;
@property (nonatomic, strong) NSNumber *sunrise;
@property (nonatomic, strong) NSNumber *sunset;
@property (nonatomic, strong) NSNumber *type;

+ (WeatherResponseSys *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
