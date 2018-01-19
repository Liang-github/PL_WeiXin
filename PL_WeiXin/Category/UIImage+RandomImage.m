//
//  UIImage+RandomImage.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "UIImage+RandomImage.h"

@implementation UIImage (RandomImage)

+ (UIImage *)randomImageInPath:(NSString *)path {
    NSString *imagePath = [NSString stringWithFormat:@"%@/%u.jpg",[[NSBundle mainBundle] bundlePath], arc4random() % 29];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    return image;
}
@end
