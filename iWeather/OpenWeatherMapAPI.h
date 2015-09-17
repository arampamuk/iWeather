//
//  OpenWeatherMapAPI.h
//  OpenWeatherMapAPI
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFHTTPRequestOperationManager.h>
#import "WeatherResponse.h"

@interface OpenWeatherMapAPI : NSObject {
    NSString *apiKey;
}

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

- (instancetype) initWithAPIKey:(NSString*) apiKey;

- (void)currentWeatherByCityName:(NSString*)name
                         success:(void (^)(WeatherResponse *responseObject))success
                         failure:(void (^)(NSError *error))failure;

- (void)getAllCityNames:(NSString *)name
                success:(void (^)(NSArray *responseObject))success
                failure:(void (^)(NSError *error))failure;
@end

