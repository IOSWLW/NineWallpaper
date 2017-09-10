//
//  WLWNetworkRequest.h
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, HttpMethod) {
    GET,
    POST,
    PUT,
    DELETE
};

@interface WLWNetworkRequest : AFHTTPSessionManager

+ (instancetype)sharedNetwork;

- (void)requestJSONDataWithPath:(NSString *)aPath
                         header:(NSString *)header
                         params:(NSDictionary *)params
                     methodType:(HttpMethod)method
                       callback:(void (^)(id data, NSError *error))block;
@end
