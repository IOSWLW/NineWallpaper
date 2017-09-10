//
//  WLWNetworkRequest.m
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWNetworkRequest.h"

@implementation WLWNetworkRequest

+ (instancetype)sharedNetwork {
    static WLWNetworkRequest *request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        request = [[WLWNetworkRequest alloc] initWithSessionConfiguration:config];
        request.responseSerializer = [AFCompoundResponseSerializer serializer];
        request.requestSerializer.timeoutInterval = 8;
    });
    return request;
}

- (void)requestJSONDataWithPath:(NSString *)aPath
                         header:(NSString *)header
                         params:(NSDictionary *)params
                     methodType:(HttpMethod)method
                       callback:(void (^)(id data, NSError *error))block {
    if (!aPath || aPath.length <= 0) {
        return;
    }
    if (header) {
        [self.requestSerializer setValue:header forHTTPHeaderField:header];
    }
    [self requestWithPath:aPath params:params methodType:method callback:block];
}
#pragma mark - Private

- (void)requestWithPath:(NSString *)aPath
                 params:(NSDictionary*)params
             methodType:(HttpMethod)method
               callback:(void (^)(id data, NSError *error))block {
    switch (method) {
        case GET: {
            [self GET:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *error = nil;
                responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&error];
                  DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                error = [self handleResponse:responseObject];
                if (block) {
                    if (error) {
                        block(nil, error);
                    } else {
                        block(responseObject, nil);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                if (block) {
                    block(nil, error);
                }
            }];
            break;
        }
        case POST: {
            [self POST:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *error = nil;
                responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&error];
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                error = [self handleResponse:responseObject];
                if (block) {
                    if (error) {
                        block(nil, error);
                    } else {
                        block(responseObject, nil);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                if (block) {
                    block(nil, error);
                }
            }];
            break;
        }
        case PUT: {
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *error = nil;
                responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&error];
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                error = [self handleResponse:responseObject];
                if (block) {
                    if (error) {
                        block(nil, error);
                    } else {
                        block(responseObject, nil);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                if (block) {
                    block(nil, error);
                }
            }];
            break;
        }
        case DELETE: {
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *error = nil;
                responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&error];
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
//                error = [self handleResponse:responseObject];
                if (block) {
                    if (error) {
                        block(nil, error);
                    } else {
                        block(responseObject, nil);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                if (block) {
                    block(nil, error);
                }
            }];
            break;
        }
        default:
            break;
    }
}

@end
