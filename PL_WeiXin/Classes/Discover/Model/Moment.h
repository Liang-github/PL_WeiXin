//
//  Moment.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Moment : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) UIImage *avatar;

@property (nonatomic, copy) NSArray *pictures;

@property (nonatomic, copy) NSArray *comments;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) NSInteger *height;

@property (nonatomic, assign) NSInteger contentLineCount;

@property (nonatomic, assign) CGFloat contentLabelHeight;

@property (nonatomic, assign) BOOL isContentExpanded;

+ (instancetype)momentWithContent:(NSString *)content name:(NSString *)name pictures:(NSArray *)pictures comments:(NSArray *)comments;
@end
