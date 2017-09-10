//
//  WLWHitPhoto.h
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/10.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface WLWHitPhoto : MTLModel <MTLJSONSerializing>

@property (assign, nonatomic) NSInteger likes;
@property (assign, nonatomic) NSInteger favorites;
@property (copy, nonatomic) NSString *tags;
@property (assign, nonatomic) NSInteger previewHeight;
@property (assign, nonatomic) NSInteger webformatHeight;
@property (assign, nonatomic) NSInteger views;
@property (assign, nonatomic) NSInteger webformatWidth;
@property (assign, nonatomic) NSInteger previewWidth;
@property (assign, nonatomic) NSInteger comments;
@property (assign, nonatomic) NSInteger downloads;
@property (copy, nonatomic) NSString *pageURL;
@property (copy, nonatomic) NSString *previewURL;
@property (copy, nonatomic) NSString *webformatURL;
@property (assign, nonatomic) NSInteger imageWidth;
@property (assign, nonatomic) NSInteger user_id;
@property (copy, nonatomic) NSString *user;
@property (copy, nonatomic) NSString *type;
@property (assign, nonatomic) NSInteger Id;
@property (copy, nonatomic) NSString *userImageURL;
@property (assign, nonatomic) NSInteger imageHeight;

@end
