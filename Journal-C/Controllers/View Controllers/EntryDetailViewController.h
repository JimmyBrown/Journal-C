//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) Entry * entry;

@end

NS_ASSUME_NONNULL_END
