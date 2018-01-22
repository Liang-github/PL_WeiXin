//
//  CommentTableViewCell.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Comment;
@interface CommentTableViewCell : UITableViewCell
@property (nonatomic, strong) Comment *model;
@end
