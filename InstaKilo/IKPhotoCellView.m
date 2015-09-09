//
//  IKPhotoCellView.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKPhotoCellView.h"

@protocol IKPhotoData <NSObject>
-(NSString*)imageName;
-(NSString*)location;
-(NSString*)subject;
@end

@interface IKPhotoCellView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation IKPhotoCellView

-(void)setContent:(id)content{
    id<IKPhotoData> photo = content;
    self.imageView.image = [UIImage imageNamed:photo.imageName];
}
@end
