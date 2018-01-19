//
//  NSString+Pinyin.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "NSString+Pinyin.h"

@implementation NSString (Pinyin)
- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformStripDiacritics, false);
    return mutableString;
}
@end
