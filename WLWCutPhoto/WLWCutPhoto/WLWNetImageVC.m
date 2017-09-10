//
//  WLWNetImageVC.m
//  WLWCutPhoto
///var/folders/c7/_50cxps55b31w2d_npp0hcwh0000gn/T/AppIconMaker/appicon.png
//  Created by 汪理伟 on 2017/9/9.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWNetImageVC.h"
#import "WLWImagePhoto.h"

@interface WLWNetImageVC ()

@end

@implementation WLWNetImageVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WLWImagePhoto requestPhotosWithParams:@"" callback:^(WLWImagePhoto *photos, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
