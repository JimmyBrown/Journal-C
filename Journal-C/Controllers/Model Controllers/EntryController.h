//
//  EntryController.h
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

// Mark: Shared Instance
+ (EntryController *)sharedInstance;

// MARK: Source of Truth
@property (nonatomic, strong) NSMutableArray * entries;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)updateEntry:(Entry *)entry
          withTitle:(NSString *)title
               text:(NSString *)text;

- (void)loadFromPersistentStorage;
- (void)saveToPersistentStorage;

@end

NS_ASSUME_NONNULL_END
