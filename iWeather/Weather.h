//
//  Weather.h
//  
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject  

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSNumber *weatherId;
@property (nonatomic, strong) NSString *main;

+ (Weather *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
