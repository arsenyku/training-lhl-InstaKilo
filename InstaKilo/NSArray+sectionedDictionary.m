//
//  NSArray+sectionedDictionary.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "NSArray+sectionedDictionary.h"

// !!!!!
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation NSArray (SectionedData)
-(NSDictionary*)dataSectionedBySelector:(SEL)selector{
    NSMutableDictionary* dictionary = [NSMutableDictionary new];

    for (id item in self) {
        id key = [NSNull null];
        if ([item respondsToSelector:selector])
            key = [item performSelector:selector];
        else
            key = [NSNull null];
        
        if ( dictionary[key] == nil )
            dictionary[key] = [NSMutableArray new];

        [((NSMutableArray*)dictionary[key]) addObject:item];
    }
    
    // Replace mutable arrays with immutable copies.
    for (id sectionKey in [dictionary allKeys]) {
        NSMutableArray *section = dictionary[sectionKey];
        dictionary[sectionKey] = [section copy];
    }
    
    return [dictionary copy];
}

@end
