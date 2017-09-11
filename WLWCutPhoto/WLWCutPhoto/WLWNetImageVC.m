//
//  WLWNetImageVC.m
//  WLWCutPhoto
///var/folders/c7/_50cxps55b31w2d_npp0hcwh0000gn/T/AppIconMaker/appicon.png
//  Created by 汪理伟 on 2017/9/9.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWNetImageVC.h"
#import "WLWImagePhoto.h"
#import "WLWPhotoCell.h"
#import <YYCache/YYCache.h>
#import <MJRefresh/MJRefresh.h>
#import "iCarousel.h"
#import <YYWebImage/YYWebImage.h>
#import "WLWHitPhoto.h"

static NSString *photoCell = @"WLWPhotoCell";

@interface WLWNetImageVC () <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) WLWImagePhoto *images;
@property (strong, nonatomic) NSMutableArray *photos;
@property (assign, nonatomic) int page;
@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (strong, nonatomic) NSMutableArray *names;


@end

@implementation WLWNetImageVC

- (NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

- (NSMutableArray *)names {
    if (!_names) {
        _names = [NSMutableArray arrayWithObjects:@"动物",@"植物",@"人",@"背景",@"科技",@"情感"@"动物",@"植物",@"人",@"背景",@"科技",@"情感",@"科技",@"情感",@"情感",nil];
    }
    return _names;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _carousel.vertical = YES;
    _carousel.type = iCarouselTypeInvertedRotary;
    NSUInteger index;
    for (index = 0; index < 14; ++index) {
        // Setup image name
        NSString *name = [NSString stringWithFormat:@"image%03ld.jpg", (unsigned long)index];
        [self.photos addObject:name];
    }
    [_carousel reloadData];

}

- (void)configTatbleView {
    [self.tableView registerNib:[UINib nibWithNibName:photoCell bundle:nil] forCellReuseIdentifier:photoCell];
    self.tableView.rowHeight = 210;
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
    }];

    [self.tableView.mj_header beginRefreshing];
}

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel {
    return _photos.count;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel {
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    UIImageView *imageView = nil;
    UILabel *label = nil;
    if (view == nil) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 375)];
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [label.font fontWithSize:50];
        imageView = [[UIImageView alloc] initWithFrame:view.bounds];
        imageView.contentMode = UIViewContentModeRedraw;
        [view addSubview:imageView];
        imageView.tag = 1;
        label.tag = 2;
        [imageView addSubview:label];
    }
    else {
        imageView = (UIImageView *)[view viewWithTag:1];
        label = (UILabel *)[view viewWithTag:2];
    }
    imageView.image = [UIImage imageNamed:_photos[index]];
    label.text = self.names[index];
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0.0, 1.0, 0.0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * self.carousel.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

- (IBAction)switchCarouselType {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Select Carousel Type"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    for (NSString *title in [self carouselTypes])
    {
        [sheet addButtonWithTitle:title];
    }
    [sheet showInView:self.view];
}

- (NSArray *)carouselTypes
{
    return [NSArray arrayWithObjects:@"Linear", @"Rotary", @"Inverted Rotary", @"Cylinder", @"Inverted Cylinder", @"Wheel", @"Inverted Wheel",  @"CoverFlow", @"CoverFlow2", @"Time Machine", @"Inverted Time Machine", @"Custom", nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0)
    {
        _carousel.type = (iCarouselType)buttonIndex;
//        navItem.title = [[self carouselTypes] objectAtIndex:buttonIndex];
    }
}

@end
