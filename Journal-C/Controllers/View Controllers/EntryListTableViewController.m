//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    EntryController *entryController = [EntryController sharedInstance];
    Entry *entry = entryController.entries[indexPath.row];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Entry * entry = [[EntryController sharedInstance] entries][indexPath.row];
        [[EntryController sharedInstance]removeEntry:entry];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
        
        EntryDetailViewController * destinationVC = [segue destinationViewController];
        destinationVC.entry = entry;
    }
}
@end
