//
//  IKPhoto.h
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKPhoto : NSObject
@property(nonatomic) NSString *imageName;
@property(nonatomic) NSString *location;
@property(nonatomic) NSString *subject;

-(instancetype)initWithImageName:(NSString*)imageName location:(NSString*)location subject:(NSString*)subject;
+(instancetype)photoWithImageName:(NSString*)imageName location:(NSString*)location subject:(NSString*)subject;
@end
