//
//  MainTabBarController.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "MainTabBarController.h"
#import "ChatViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "ContactsViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    ChatViewController *chatVC = [[ChatViewController alloc] init];
    chatVC.title = @"微信";
    
    ContactsViewController *addbkVC = [[ContactsViewController alloc] init];
    addbkVC.title = @"通讯录";
    
    DiscoverViewController *foundVC = [[DiscoverViewController alloc] init];
    foundVC.title = @"发现";
    
    MeViewController *meVC = [[MeViewController alloc] init];
    meVC.title = @"我";
    
    self.viewControllers = @[
                             [self giveMeNavWithVC:chatVC
                                        andImgName:@"tabbar_mainframe"
                                  andSelectImgName:@"tabbar_mainframeHL"],
                             [self giveMeNavWithVC:addbkVC
                                        andImgName:@"tabbar_contacts"
                                  andSelectImgName:@"tabbar_contactsHL"],
                             [self giveMeNavWithVC:foundVC
                                        andImgName:@"tabbar_discover"
                                  andSelectImgName:@"tabbar_discoverHL"],
                             [self giveMeNavWithVC:meVC
                                        andImgName:@"tabbar_me"
                                  andSelectImgName:@"tabbar_meHL"]
                             ];
    self.tabBar.tintColor =
    [UIColor colorWithRed:9 / 255.0 green:187 / 255.0 blue:7 / 255.0 alpha:1];
}
/**
 * 返回取消渲染的image
 */
- (UIImage *)removeRendering:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UINavigationController *)giveMeNavWithVC:(UIViewController *)VC andImgName:(NSString *)imgName andSelectImgName:(NSString *)selectImgName {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:VC.title image:[self removeRendering:imgName] selectedImage:[self removeRendering:selectImgName]];
    return nav;
}

@end
