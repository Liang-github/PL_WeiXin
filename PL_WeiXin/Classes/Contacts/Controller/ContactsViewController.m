//
//  ContactsViewController.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsTableViewCell.h"
#import "Constants.h"
#import "GlassView.h"
#import "SearchResultController.h"
#import "UIImage+Common.h"
#import "UIImage+RandomImage.h"
#import <NSArray+SortContact.h>

@interface ContactsViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *firstSectionData;

@property (nonatomic, copy) NSArray *contacts;

@property (nonatomic, copy) NSArray *grouppedContacts;

@property (nonatomic, copy) NSArray *headers;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) GlassView *glassView;

@property (nonatomic, strong) NSMutableArray *filterResults;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeData];
    [self buildTableView];
}
- (void)initializeData {
    self.firstSectionData = @[
                              @[ @"plugins_FriendNotify", @"新的朋友" ],
                              @[ @"add_friend_icon_addgroup", @"群聊" ],
                              @[ @"Contact_icon_ContactTag", @"标签" ],
                              @[ @"add_friend_icon_offical", @"公众号" ]
                              ];
    
    self.contacts = @[
                      @"吴正祥",
                      @"陈维",
                      @"赖杰",
                      @"范熙丹",
                      @"丁亮",
                      @"赵雨彤",
                      @"落落",
                      @"Leo琦仔",
                      @"廖宇超",
                      @"Darui Li",
                      @"刘洋"
                      ];
    [self.contacts sortContactTOTitleAndSectionRow_A_EC:^(BOOL isSuccess, NSArray *titleArray, NSArray *rowArray) {
        if (!isSuccess) {
            return;
        }
        self.grouppedContacts = rowArray;
        self.headers = titleArray;
    }];
}
- (void)buildTableView {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tableView.rowHeight = 50;
        
        tableView.tableFooterView = [self tableFooterView];
        tableView.tableHeaderView = [self tableHeaderView];
        
        // sectionIndex样式
        tableView.sectionIndexColor = [UIColor grayColor];
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        
        tableView;
    });
    [self.view addSubview:_tableView];
}
#pragma mark - search
- (UISearchBar *)tableHeaderView {
    NSMutableArray *tempImageArray = [NSMutableArray array];
    for (int i = 0; i < self.contacts.count; i ++) {
        [tempImageArray addObject:[UIImage randomImageInPath:@"images/cell_icons"]];
    }
    SearchResultController *resultController = [[SearchResultController alloc] initWithKeywords:self.contacts andImages:tempImageArray];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultController];
    self.searchController.searchResultsUpdater = resultController;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.delegate = self;
    
    UISearchBar *bar = self.searchController.searchBar;
    [bar sizeToFit];
    bar.delegate = self;
    bar.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    bar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(bar.frame.size.width, bar.frame.size.height)];
    bar.placeholder = @"搜索";
    bar.tintColor = [Constants themeColor];
    bar.showsBookmarkButton = YES;
    [bar setImage:[UIImage imageNamed:@"VoiceSearchStartBtn"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    return self.searchController.searchBar;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    
    UIButton *btn = [searchBar valueForKey:@"_cancelButton"];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
}
- (GlassView *)glassView {
    if (!_glassView) {
        _glassView = [[GlassView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    }
    return _glassView;
}
- (void)willPresentSearchController:(UISearchController *)searchController {
    [self.view addSubview:self.glassView];
}
- (void)willDismissSearchController:(UISearchController *)searchController {
    [self.glassView removeFromSuperview];
}
#pragma mark - footer
- (UIView *)tableFooterView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = [NSString stringWithFormat:@"%lu位联系人",(unsigned long)self.contacts.count];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    [view addSubview:label];
    return view;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.headers.count + 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.firstSectionData.count;
    } else {
        return [self.grouppedContacts[section - 1] count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"contactsCellIdentifier";
    ContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[ContactsTableViewCell alloc] init];
        [cell setRestorationIdentifier:identifier];
        // 调整分割线长度
        cell.preservesSuperviewLayoutMargins = false;
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(ContactsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        cell.avatar = [UIImage imageNamed:self.firstSectionData[indexPath.row][0]];
        cell.name = self.firstSectionData[indexPath.row][1];
    } else {
        cell.avatar = [UIImage randomImageInPath:@"Images/cell_icons"];
        cell.name = self.grouppedContacts[indexPath.section - 1][indexPath.row];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
        headerView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        
        UILabel *HeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        HeaderLabel.textColor = [UIColor lightGrayColor];
        HeaderLabel.font = [UIFont systemFontOfSize:14];
        HeaderLabel.text = self.headers[section - 1];
        HeaderLabel.frame = CGRectMake(10, 0, headerView.bounds.size.width, headerView.bounds.size.height);
        [headerView addSubview:HeaderLabel];
        return headerView;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 20;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.headers;
}
@end
