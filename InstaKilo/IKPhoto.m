//
//  IKPhoto.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKPhoto.h"

@implementation IKPhoto
- (instancetype)init{
    return [self initWithImageName:@"" location:@"" subject:@""];
}

-(instancetype)initWithImageName:(NSString*)imageName location:(NSString*)location subject:(NSString*)subject{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _location = location;
        _subject = subject;
    }
    return self;
}

+(instancetype)photoWithImageName:(NSString *)imageName location:(NSString *)location subject:(NSString *)subject{
    return [[IKPhoto alloc] initWithImageName:imageName location:location subject:subject];
}

@end
