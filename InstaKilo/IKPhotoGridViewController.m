//
//  ViewController.m
//  InstaKilo
//
//  Created by asu on 2015-09-09.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "IKPhotoGridViewController.h"
#import "IKPhotoCellView.h"
#import "IKCollectionSectionTitle.h"
#import "IKPhoto.h"
#import "NSArray+sectionedDictionary.h"
#import "NSDictionary+sortedKeys.h"

@interface IKPhotoGridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property(nonatomic) NSDictionary *photosByLocation;
@property(nonatomic) NSDictionary *photosBySubject;
@property(nonatomic) BOOL sortByLocation;

@property(nonatomic, readonly) NSDictionary *groupedPhotos;
@end

@implementation IKPhotoGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *photos = @[
                    [IKPhoto photoWithImageName:@"IMG1" location:@"AAAAA" subject:@"S4"],
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
    
    self.photosByLocation = [photos dataSectionedBySelector:@selector(location)];
    self.photosBySubject = [photos dataSectionedBySelector:@selector(subject)];
    
    self.sortByLocation = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - events from controls

- (IBAction)segmentValueChanged:(UISegmentedControl*)sender {
    self.sortByLocation = (sender.selectedSegmentIndex == 0);
    [self refresh];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    id sectionKey = [self.groupedPhotos sortedKeys][section];
    NSArray *photosForKey = self.groupedPhotos[sectionKey];
    return [photosForKey count];
}

// The cell that is returned must be retrieved from a call to
// -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IKPhotoCellView *cell = (IKPhotoCellView*)[collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    id sectionKey = [self.groupedPhotos sortedKeys][indexPath.section];
    IKPhoto *photo = self.groupedPhotos[sectionKey][indexPath.row];
    [cell setContent:(id<IKPhotoData>)photo];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.groupedPhotos count];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath{

    IKCollectionSectionTitle *sectionTitleView =
    [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                       withReuseIdentifier:@"sectionTitle"
                                              forIndexPath:indexPath];

    NSString *sectionTitle = [self.groupedPhotos sortedKeys][indexPath.section];
    if ([sectionTitle isKindOfClass:[NSNull class]]){
        sectionTitle = @"No set location";
    }
    
    [sectionTitleView setSectionTitle:sectionTitle];
    return sectionTitleView;
}


#pragma mark - private

-(void)refresh{
    [self.photoCollectionView reloadData];
}

-(NSDictionary*)groupedPhotos{
    if (self.sortByLocation)
        return self.photosByLocation;
    else
        return self.photosBySubject;
}


@end
