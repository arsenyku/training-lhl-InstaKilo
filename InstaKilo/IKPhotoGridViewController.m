//
//  ViewController.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKPhotoGridViewController.h"
#import "IKPhotoCellView.h"
#import "IKPhoto.h"

@interface IKPhotoGridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property(nonatomic) NSArray *photos;
@end

@implementation IKPhotoGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.photos = @[
                    [IKPhoto photoWithImageName:@"IMG1" location:@"AAAAA" subject:@"S1"],
                    [IKPhoto photoWithImageName:@"IMG2" location:@"AAAAA" subject:@"S2"],
                    [IKPhoto photoWithImageName:@"IMG3" location:@"AAAAA" subject:@"S3"],
                    [IKPhoto photoWithImageName:@"IMG4" location:@"BBBBB" subject:@"S4"],
                    [IKPhoto photoWithImageName:@"IMG5" location:@"BBBBB" subject:@"S1"],
                    [IKPhoto photoWithImageName:@"IMG6" location:@"BBBBB" subject:@"S2"],
                    [IKPhoto photoWithImageName:@"IMG7" location:@"CCCCC" subject:@"S3"],
                    [IKPhoto photoWithImageName:@"IMG8" location:@"CCCCC" subject:@"S4"],
                    [IKPhoto photoWithImageName:@"IMG9" location:@"DDDDD" subject:@"S1"],
                    [IKPhoto photoWithImageName:@"IMG10" location:@"DDDDD" subject:@"S2"]
                    ];

	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -<UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.photos count];
}

// The cell that is returned must be retrieved from a call to
// -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IKPhotoCellView *cell = (IKPhotoCellView*)[collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    IKPhoto *photo = self.photos[indexPath.row];
    [cell setContent:photo];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
