//
//  OpenWeatherMapAPI.m
//  OpenWeatherMapAPI
//
//  Created by Aram Pamuk on 15/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//


#import "OpenWeatherMapAPI.h"



#define API_MAIN_URL @"http://api.openweathermap.org/data/2.5/"
#define API_CITIES_URL @"http://openweathermap.org/help/city_list.txt"

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
    [params setValue:@"tr" forKey:@"lang"];
    
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

- (void)getAllCityNames:(NSString *)name
                         success:(void (^)(NSArray *responseObject))success
                         failure:(void (^)(NSError *error))failure {
    
 
    AFHTTPRequestOperationManager *cityManager = [AFHTTPRequestOperationManager manager];
    cityManager.responseSerializer = [AFCompoundResponseSerializer serializer];
    cityManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [cityManager GET:API_CITIES_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *test;
        NSString* encodedString = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        
        
        //NSString *aString = @"hello world       this may     have lots   of sp:ace or little      space";
        //NSArray *array = [aString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
        
        NSArray *array = [encodedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \t"]];
        array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
        
        NSMutableArray *cityArray =  [[NSMutableArray alloc] init];
        
        int count = 0;
        for (int i = 0; i< [array count]; i++) {
            
            if (count == 1) {
                
                [cityArray addObject:[array objectAtIndex:i]];
            }
            
            if (count == 4) {
                count = 0;
            }
            
            count++;
            
            NSLog(@"%@", [array objectAtIndex:i]);
        }
        
        //[aaarray removeObjectAtIndex:0];
        
        
      
        
        
        NSLog(@"%@", encodedString);
        success(test);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
 
    /*
    
    NSString *path = @"http://openweathermap.org/help/city_list.txt";
    
    AFHTTPRequestOperationManager *cityManager = [AFHTTPRequestOperationManager manager];
    
    cityManager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    cityManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [cityManager POST:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString* encodedString = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        
        NSLog(@"%@", encodedString);
        
        success(nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(nil);
    }];
     
     */
}




-(void)dealloc {
    self.manager = nil;
}




@end
