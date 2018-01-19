//
//  SearchResultController.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "SearchResultController.h"
#import "NSString+Pinyin.h"
#import "ContactsTableViewCell.h"

@interface SearchResultController ()

@property (nonatomic, copy) NSArray *keywords;

@property (nonatomic, copy) NSArray<UIImage *> *images;

@property (nonatomic, strong) NSMutableArray<NSNumber *> *filteredResultIndexes;
@end

@implementation SearchResultController

// 初始化方法
- (instancetype)initWithKeywords:(NSArray *)keywords andImages:(NSArray<UIImage *> *)images {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.keywords = keywords;
        self.images = images;
        self.filteredResultIndexes = [NSMutableArray array];
        
        self.tableView.rowHeight = 60;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredResultIndexes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"searchResultCell";
    ContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(ContactsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = [self.filteredResultIndexes[indexPath.row] integerValue];
    cell.avatar = self.images[index];
    cell.name = self.keywords[index];
}
#pragma mark - search result updating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    [self.filteredResultIndexes removeAllObjects];
    
    if (searchString.length > 0) {
        for (int i = 0; i < self.keywords.count; i ++) {
            NSString *keyword = self.keywords[i];
            
            NSString *pinyin = [NSString stringWithFormat:@"%@",[keyword transformToPinyin]];
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@",searchString];
            
            if (![predicate evaluateWithObject:pinyin] && ![predicate evaluateWithObject:keyword]) {
                continue;
            }
            [self.filteredResultIndexes addObject:@(i)];
        }
    }
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = CGRectMake(0, -40, self.view.bounds.size.width, self.view.bounds.size.height);
}
@end
