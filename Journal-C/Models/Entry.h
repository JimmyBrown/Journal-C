//
//  Entry.h
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSDate * timestamp;

- (instancetype) initWithTitle:(NSString *)title
                          text:(NSString *)text
                     timestamp:(NSDate *)timestamp;

- (instancetype) dictionaryCopy:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
