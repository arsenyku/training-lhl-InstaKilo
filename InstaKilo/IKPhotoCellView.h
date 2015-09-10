//
//  IKPhotoCellView.h
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IKPhotoData <NSObject>
-(NSString*)imageName;
-(NSString*)location;
-(NSString*)subject;
@end

@interface IKPhotoCellView : UICollectionViewCell
-(void)setContent:(id<IKPhotoData>)content;
@end
