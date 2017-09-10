//
//  WLWImagePhoto.m
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWImagePhoto.h"
#import "WLWNetworkRequest.h"
#import "WLWHitPhoto.h"

@implementation WLWImagePhoto

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"totalHits" :@"totalHits",
             @"hits" :@"hits",
             @"total" :@"total"
             };
}

+ (NSValueTransformer *)hitsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WLWHitPhoto class]];
}

+ (void)requestPhotosWithParams:(NSString *)params callback:(void(^)(WLWImagePhoto *photo,NSError *error))block {
    NSString *path = [NSString stringWithFormat:@"https://pixabay.com/api/?key=5950348-3db6713241de0eed1bacdfb1b&lang=zh&%@",params];
    [[WLWNetworkRequest sharedNetwork] requestJSONDataWithPath:path header:nil params:nil methodType:GET callback:^(id data, NSError *error) {
        if (block) {
            WLWImagePhoto *images = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:data error:&error];
            block(images, error);
        }
    }];
}

@end
