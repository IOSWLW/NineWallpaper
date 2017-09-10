//
//  WLWImagePhoto.h
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

/* 
 key
 lang
 q
 id
 response_grounp   image_details high_resolution
 
 */

@interface WLWImagePhoto : MTLModel <MTLJSONSerializing>

@property (assign, nonatomic) NSInteger totalHits;
@property (assign, nonatomic) NSInteger total;
@property (strong, nonatomic) NSArray *hits;

+ (void)requestPhotosWithParams:(NSString *)params callback:(void(^)(WLWImagePhoto *photo,NSError *error))block;

@end
