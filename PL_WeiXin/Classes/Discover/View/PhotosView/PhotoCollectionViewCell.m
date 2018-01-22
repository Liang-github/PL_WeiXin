//
//  PhotoCollectionViewCell.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import <Masonry.h>

@interface PhotoCollectionViewCell ()
@end
@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildCell];
        [self bindConstraints];
    }
    return self;
}
- (void)buildCell {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];
}

- (void)bindConstraints
{
    [self.imageView mas_updateConstraints:^(MASConstraintMaker* make) {
        make.top.left.right.bottom.offset(0);
    }];
}
@end
