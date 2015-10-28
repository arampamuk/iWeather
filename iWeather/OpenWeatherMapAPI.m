//
//  OpenWeatherMapAPI.m
//  OpenWeatherMapAPI
//
//  Created by Aram Pamuk on 15/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//


#import "OpenWeatherMapAPI.h"



#define API_MAIN_URL @"http://api.openweathermap.org/data/2.5/"

@interface OpenWeatherMapAPI () 

@end

@implementation OpenWeatherMapAPI

- (instancetype) initWithAPIKey:(NSString *) aApiKey {
    self = [super init];
    if (self) {
        apiKey = aApiKey;
        self.manager = [AFHTTPRequestOperationManager.alloc initWithBaseURL:[NSURL URLWithString:API_MAIN_URL]];
        
        [self.manager.operationQueue setMaxConcurrentOperationCount:1];
    }
    return self;
}

- (NSMutableDictionary*)getParameters {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    [params setValue:apiKey forKey:@"APPID"];
    [params setValue:@"metric" forKey:@"units"];
    [params setValue:@"en-GB" forKey:@"lang"];
    
    return params;
}
 

- (void)currentWeatherByCityName:(NSString *)name
                         success:(void (^)(WeatherResponse *responseObject))success
                         failure:(void (^)(NSError *error))failure {
    
    NSMutableDictionary* params = [self getParameters];
    [params setValue:name forKey:@"q"];
    
    [self.manager GET:@"weather" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        WeatherResponse *weatherResponse = [WeatherResponse instanceFromDictionary:responseObject];
        
        success(weatherResponse);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}



-(void)dealloc {
    self.manager = nil;
}




@end
