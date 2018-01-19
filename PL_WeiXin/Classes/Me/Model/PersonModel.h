//
//  PersonModel.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject
// 用户头像
@property (nonatomic, copy) NSString *avatar;
// 用户名称
@property (nonatomic, copy) NSString *name;
// 微信号
@property (nonatomic, copy) NSString *wechatId;

@end
