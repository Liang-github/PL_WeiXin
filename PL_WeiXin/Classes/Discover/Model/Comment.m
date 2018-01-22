//
//  Comment.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (instancetype)commentWithName:(NSString *)name content:(NSString *)content {
    Comment *model = [[Comment alloc] init];
    model.name = name;
    model.content = content;
    
    return model;
}
@end
