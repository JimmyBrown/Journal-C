//
//  Entry.m
//  Journal-C
//
//  Created by Jimmy on 5/4/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)dictionaryCopy:(NSDictionary *)dictionary
{
    NSString * title = dictionary[@"title"];
    NSString * text = dictionary[@"text"];
    NSString * timestamp = dictionary[@"timestamp"];
    return [self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
        @"title": self.title,
        @"text": self.text,
        @"timestamp": self.timestamp
    };
}

@end
