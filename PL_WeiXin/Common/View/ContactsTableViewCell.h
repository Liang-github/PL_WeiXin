//
//  ContactsTableViewCell.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ContactsTableViewCellStyle) {
    ContactsTableViewCellStyleDefault = 0,
    ContactsTableViewCellStyleSubtitle
};

@interface ContactsTableViewCell : UITableViewCell

@property (nonatomic, assign) ContactsTableViewCellStyle style;
@property (nonatomic, assign) CGFloat avatarCornerRadius;

// 请按照以下顺序设值
@property (nonatomic, strong) UIImage *avatar;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *descriptionText;

@end
