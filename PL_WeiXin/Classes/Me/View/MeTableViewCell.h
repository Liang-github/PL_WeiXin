//
//  MeTableViewCell.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonModel;
@interface MeTableViewCell : UITableViewCell

@property (nonatomic, strong) PersonModel *model;

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *wechatIdLabel;

@property (nonatomic, strong) UIImageView *barcodeImageView;

@end
