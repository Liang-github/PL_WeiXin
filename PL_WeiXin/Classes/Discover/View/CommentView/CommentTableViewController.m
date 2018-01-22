//
//  CommentTableViewController.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "CommentTableViewController.h"
#import "Comment.h"
#import "CommentTableViewCell.h"
#import "MomentsDataSource.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+FDTemplateLayoutCell.h>


static NSString *const kIdentifier = @"commentIdentifier";
@interface CommentTableViewController ()

@property (nonatomic, strong) MomentsDataSource *dataSource;
@end

@implementation CommentTableViewController

- (void)viewDidDisappear:(BOOL)animated {
    self.dataSource = nil;
    self.comments = nil;
    
    [self.tableView removeFromSuperview];
    self.tableView = nil;
}
- (MomentsDataSource *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[MomentsDataSource alloc] init];
        
    }
    return _dataSource;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect rect = self.tableView.frame;
    rect.size = self.tableView.contentSize;
    
    self.tableView.frame = rect;
}
- (instancetype)init {
    if (self = [super init]) {
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.scrollEnabled = NO;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:kIdentifier];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setComments:(NSArray *)comments {
    _comments = comments;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    Comment* model = self.comments[indexPath.row];
    
    if (!model.height) {
        __weak typeof(self) weakSelf = self;
        model.height = [tableView
                        fd_heightForCellWithIdentifier:kIdentifier
                        configuration:^(CommentTableViewCell* cell) {
                            cell.fd_enforceFrameLayout = true;
                            [weakSelf configureCell:cell atIndexPath:indexPath];
                        }];
    }
    return model.height;
}
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CommentTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(CommentTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    Comment* model = self.comments[indexPath.row];
    cell.model = model;
}

@end
