//
//  NSArray+sectionedDictionary.h
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SectionedData)
-(NSDictionary*)dataSectionedBySelector:(SEL)selector;
@end
