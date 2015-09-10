//
//  IKPhotoCellView.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKPhotoCellView.h"

@interface IKPhotoCellView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation IKPhotoCellView

-(void)setContent:(id<IKPhotoData>)content{
    self.imageView.image = [UIImage imageNamed:content.imageName];
}
@end
