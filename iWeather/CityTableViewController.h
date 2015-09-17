//
//  CityViewController.h
//  iWeather
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
     NSMutableArray *cities;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonBackAdd;

- (IBAction)barButtonBackViewClick:(UIBarButtonItem *)sender;
- (IBAction)barButtonEditDoneClick:(UIBarButtonItem *)sender;



@end
