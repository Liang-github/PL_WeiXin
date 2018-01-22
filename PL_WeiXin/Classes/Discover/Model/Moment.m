//
//  Moment.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "Moment.h"

@implementation Moment

+ (instancetype)momentWithContent:(NSString *)content name:(NSString *)name pictures:(NSArray *)pictures comments:(NSArray *)comments {
    Moment *model = [[Moment alloc] init];
    model.content = content;
    model.name = name;
    model.pictures = pictures;
    model.comments = comments;
    
    return model;
}
@end
