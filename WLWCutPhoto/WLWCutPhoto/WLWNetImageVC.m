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

static NSString *photoCell = @"WLWPhotoCell";

@interface WLWNetImageVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) WLWImagePhoto *images;
@property (strong, nonatomic) NSMutableArray *photos;
@property (assign, nonatomic) int page;

@end

@implementation WLWNetImageVC

- (NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTatbleView];
}

- (void)configTatbleView {
    [self.tableView registerNib:[UINib nibWithNibName:photoCell bundle:nil] forCellReuseIdentifier:photoCell];
    self.tableView.rowHeight = 210;
    _page = 1;
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self requestDataSource];
    }];

    [self.tableView.mj_header beginRefreshing];
}

- (void)requestDataSource {
    [WLWImagePhoto requestPhotosWithParams:[NSString stringWithFormat:@"page=%d",_page] callback:^(WLWImagePhoto *photos, NSError *error) {
        if (photos) {
            self.images = photos;
        }
    }];
}

- (void)setImages:(WLWImagePhoto *)images {
    _images = images;
    [self.photos addObjectsFromArray:_images.hits];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photos.count?:10;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLWPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:photoCell];
    cell.photo = _photos[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (self.displayLink == nil && (-scrollView.contentOffset.y - 64.5) > 0) {
//        self.jellyView = [[JellyView alloc]initWithFrame:CGRectMake(0, -jellyHeaderHeight , [UIScreen mainScreen].bounds.size.width, jellyHeaderHeight)];
//        self.jellyView.backgroundColor = [UIColor clearColor];
//        [self.view insertSubview:self.jellyView aboveSubview:self.tableView];
//        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
//        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//    }
//}

@end
