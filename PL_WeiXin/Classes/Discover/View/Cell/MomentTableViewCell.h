//
//  MomentTableViewCell.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Moment;
@interface MomentTableViewCell : UITableViewCell

- (void)setModel:(Moment *)model;

@property (nonatomic, copy) void(^toggleTextExpand)(NSIndexPath *indexPath);
@end
