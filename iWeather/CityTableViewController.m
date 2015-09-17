//
//  CityViewController.m
//  iWeather
//
//  Created by Aram Pamuk on 16/09/2015.
//  Copyright (c) 2015 Aram Pamuk. All rights reserved.
//

#import "CityTableViewController.h"

@interface CityTableViewController ()

@end

@implementation CityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
        [self.tableView reloadData];
  
    
    
    [self loadPlist];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"CityTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [cities objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [cities count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [cities removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        [self savePlist];
    }
}


- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destRow = destinationIndexPath.row;
    id object = [cities objectAtIndex:sourceRow];
    
    [cities removeObjectAtIndex:sourceRow];
    [cities insertObject:object atIndex:destRow];
    
    [self savePlist];    
}





- (IBAction)buttonAddClick:(UIButton *)sender {
 
    [cities addObject:self.textFieldCity.text];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[cities indexOfObject:self.textFieldCity.text] inSection:0];
    [self.tableView beginUpdates];
    [self.tableView
     insertRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];
    
    self.textFieldCity.text = @"";
    
    [self savePlist];
  
}

- (IBAction)backViewController:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)savePlist {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    [cities writeToFile:path atomically:YES];
}

- (void)loadPlist {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"];
    cities = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    //For first record
    if (cities == nil) {
        cities = [[NSMutableArray alloc] init];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
