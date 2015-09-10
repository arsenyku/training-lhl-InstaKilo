//
//  NSDictionary+sortedKeys.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "NSDictionary+sortedKeys.h"


@implementation NSDictionary (SortedKeys)
-(NSArray*)sortedKeys{
    return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

@end
