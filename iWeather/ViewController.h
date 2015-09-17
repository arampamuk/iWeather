//
//  ViewController.h
//  iWeather
//
//  Created by Aram Pamuk on 15/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKSwipeBetweenViewControllers.h"


@interface ViewController : UIViewController {
    NSString *currentCity;
}

@property (weak, nonatomic) IBOutlet UIImageView *weatherImage1;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentTemp;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *labelLastUpdate;

- (IBAction)buttonRefreshClick:(UIButton *)sender;




@end

