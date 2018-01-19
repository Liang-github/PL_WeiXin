//
//  SearchResultController.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UITableViewController<UISearchResultsUpdating>

- (instancetype)initWithKeywords:(NSArray *)keywords andImages:(NSArray<UIImage *> *)images;

@end
