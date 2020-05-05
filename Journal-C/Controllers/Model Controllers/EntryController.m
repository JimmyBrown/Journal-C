//
//  EntryController.m
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@implementation EntryController

+ (EntryController *)sharedInstance
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init;
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray new];
    }
    return self;
}

- (void)addEntry:(Entry *)entry
{
    [_entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)updateEntry:(Entry *)entry withTitle:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    
    for (NSDictionary *dictionary in entryDictionaries)
    {
        Entry * entry = [[Entry new] dictionaryCopy: dictionary];
        [self addEntry:entry];
    }
}

@end
