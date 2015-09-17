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

    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tempImageView;
  
    
    [self loadPlist];
    
    if ([cities count] == 0) {
    
        [self barButtonEditDoneClick:nil]; //For apear add button
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Please add a city." message:@"" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"CityTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [cities objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
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





- (IBAction)barButtonBackViewClick:(UIBarButtonItem *)sender {
    
    if (self.editing == YES) {

        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Please add a city." message:@"" delegate:self cancelButtonTitle:@"Add" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        
        UITextField * alertTextField = [alert textFieldAtIndex:0];
        alertTextField.keyboardType = UIKeyboardTypeAlphabet;
        alertTextField.placeholder = @"Glasgow";
        [alert show];
        
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)barButtonEditDoneClick:(UIBarButtonItem *)sender {
    
    if (self.editing == YES) {
        self.barButtonEditDone.title = @"Edit";
        self.barButtonBackAdd.title = @"< Back";
        
        [super setEditing:NO animated:YES];
        [self.tableView setEditing:NO animated:YES];
        [self.tableView reloadData];
        
    } else {
        self.barButtonEditDone.title = @"Done";
        self.barButtonBackAdd.title = @"Add";
        
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
        [self.tableView reloadData];
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    NSString *cityName = [[alertView textFieldAtIndex:0] text];
    
    if ([[cityName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] != 0) {
        [cities addObject:cityName];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[cities indexOfObject:cityName] inSection:0];
        [self.tableView beginUpdates];
        [self.tableView
         insertRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];
        
        [self savePlist];
    }
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

- (BOOL)prefersStatusBarHidden {
    
    return YES;
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
