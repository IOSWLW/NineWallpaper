//
//  WLWHitPhoto.m
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWHitPhoto.h"

@implementation WLWHitPhoto

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"previewHeight" :@"previewHeight",
             @"likes" :@"likes",
             @"favorites" :@"favorites",
             @"tags" :@"tags",
             @"webformatHeight" :@"webformatHeight",
             @"views" :@"views",
             @"webformatWidth" :@"webformatWidth",
             @"previewWidth" :@"previewWidth",
             @"comments" :@"comments",
             @"downloads" :@"downloads",
             @"pageURL" :@"pageURL",
             @"previewURL" :@"previewURL",
             @"webformatURL" :@"webformatURL",
             @"imageWidth" :@"imageWidth",
             @"user_id" :@"user_id",
             @"user" :@"user",
             @"type" :@"type",
             @"Id" :@"id",
             @"userImageURL" : @"userImageURL",
             @"imageHeight" : @"imageHeight"};
}

@end
