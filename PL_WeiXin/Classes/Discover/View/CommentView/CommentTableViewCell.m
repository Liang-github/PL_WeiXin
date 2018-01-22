//
//  CommentTableViewCell.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "Comment.h"
#import <Masonry.h>
#import "WeChatHelper.h"

@interface CommentTableViewCell ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *content;

@end
@implementation CommentTableViewCell

- (void)dealloc {
    self.model = nil;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = 0;
        self.backgroundColor = [UIColor clearColor];
        
        [self buildCell];
    }
    return self;
}
- (void)setModel:(Comment *)model {
    _model = model;
    
    NSString *str = [NSString stringWithFormat:@"%@: %@",model.name,model.content];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[WeChatHelper wechatFontColor] range:NSMakeRange(0, model.name.length)];
    self.label.attributedText = attrStr;
    
    CGSize size = [self.label sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    self.label.frame = CGRectMake(2, 1, size.width, size.height);
}
- (void)buildCell {
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByCharWrapping;
    self.label.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.label];
}
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat height = self.label.frame.size.height;
    return CGSizeMake(self.frame.size.width, height);
}
@end
