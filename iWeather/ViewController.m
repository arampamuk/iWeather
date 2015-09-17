//
//  ViewController.m
//  iWeather
//
//  Created by Aram Pamuk on 15/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//

#import "ViewController.h"
#import "OpenWeatherMapAPI.h"
#import "Weather.h"
#import "WeatherResponseSys.h"
#import "WeatherResponseMain.h"

@interface ViewController () {
    OpenWeatherMapAPI *openWeatherMapAPI;
}

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    [self fetchWeatherData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    openWeatherMapAPI = [[OpenWeatherMapAPI alloc] initWithAPIKey:@"cff63f1344c16654eb2b282461c09fa0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonRefreshClick:(UIButton *)sender {
    [self fetchWeatherData];
}

 

- (void)loadFirstRecord {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    NSArray *cities = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    //For first record
    if (cities == nil) {
        // Redirect CityTableViewController
    }
    else {
        currentCity = cities[0];
    }
}

- (void) fetchWeatherData {
    
    [self loadFirstRecord];
    if (currentCity == nil) {
        return;
    }
    
    [self.activityIndicator startAnimating];
    [openWeatherMapAPI currentWeatherByCityName:currentCity success:^(WeatherResponse *responseObject) {
        
        [NSThread sleepForTimeInterval:1.0f];
        self.labelCity.text =  [NSString stringWithFormat:@"%@, %@", responseObject.name, responseObject.sys.country];
        self.labelCurrentTemp.text = [NSString stringWithFormat:@"%.1f℃", [responseObject.main.temp floatValue]];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd/mm/yyyy HH:mm:ss"];
        self.labelLastUpdate.text = [format stringFromDate:[NSDate date]];
        
        [self.weatherImage1 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:((Weather*)responseObject.weather[0]).iconUrl]]]];
        
        [self.activityIndicator stopAnimating];
        
    } failure:^(NSError *error) {
        
        [self.activityIndicator stopAnimating];
    }];
}

 
@end
