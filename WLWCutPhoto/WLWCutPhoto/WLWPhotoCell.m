//
//  WLWPhotoCell.m
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWPhotoCell.h"
#import "WLWHitPhoto.h"
#import <YYWebImage/YYWebImage.h>

@interface WLWPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation WLWPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPhoto:(WLWHitPhoto *)photo {
    _photo = photo;
   [_photoView yy_setImageWithURL:[NSURL URLWithString:_photo.webformatURL] placeholder:[UIImage imageNamed:@"Logo"] options: YYWebImageOptionSetImageWithFadeAnimation completion:nil];

}

@end
