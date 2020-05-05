//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "Entry.h"
#import "EntryListTableViewController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

// MARK: Outlets
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textField;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (self.entry) {
        self.titleLabel.text = self.entry.title;
        self.textField.text = self.entry.text;
    }
}

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleLabel.text = @"";
    self.textField.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.titleLabel.text;
        self.entry.text = self.textField.text;
        self.entry.timestamp = [NSDate date];
    } else {
        Entry * entry = [[Entry alloc] initWithTitle: self.titleLabel.text text: self.textField.text timestamp: [NSDate date]];
        
        [[EntryController sharedInstance] addEntry:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
