//
//  InsetsTextField.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/19.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "InsetsTextField.h"

@implementation InsetsTextField

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.textFieldInset.x, self.textFieldInset.y);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.textFieldInset.x, self.textFieldInset.y);
}

@end
