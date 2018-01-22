//
//  PhotosCollectionViewController.h
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSUInteger const kPhotoSize = 90;
static NSUInteger const kPhotoSizeSingle = 150;
static NSUInteger const kCellSpacing = 5;

@interface PhotosCollectionViewController : UICollectionViewController
@property (nonatomic, copy) NSArray<UIImage *> * photosArray;
@property (nonatomic, assign) BOOL calculatedSize;
@end
