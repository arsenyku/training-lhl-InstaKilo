//
//  IKCollectionSectionTitle.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKCollectionSectionTitle.h"
@interface IKCollectionSectionTitle()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) NSString* title;
@end
@implementation IKCollectionSectionTitle

-(void)setSectionTitle:(NSString *)title{
    self.title = title;
    
    [self refresh];
}

-(void)refresh{
    self.titleLabel.text = self.title;
    
}
@end
