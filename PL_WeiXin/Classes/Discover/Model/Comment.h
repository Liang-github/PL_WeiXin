//
//  Comment.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, assign) float height;

+ (instancetype)commentWithName:(NSString *)name content:(NSString *)content;
@end
