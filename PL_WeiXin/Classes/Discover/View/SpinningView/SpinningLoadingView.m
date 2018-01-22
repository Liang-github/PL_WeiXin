//
//  SpinningLoadingView.m
//  PL_WeiXin
//
//  Created by PengLiang on 2018/1/22.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "SpinningLoadingView.h"
#import "CoverHeaderView.h"

static NSString *const kRotateAnimationKey = @"RotateAnimation";
static NSUInteger const kSpinningPosition = 30;
static NSUInteger const kViewHeight = 60;
static NSUInteger const kSpinningSize = 30;

@interface SpinningLoadingView ()

@property (nonatomic, weak) UIImageView *spinningView;
@property (nonatomic, strong) CoverHeaderView *coverView;
@property (nonatomic, strong) CABasicAnimation *rotateAnimation;
@end
@implementation SpinningLoadingView
- (void)prepare
{
    [super prepare];
    
    self.mj_h = kViewHeight;
    
    UIImageView* spinningView = [[UIImageView alloc]
                                 initWithImage:[UIImage imageNamed:@"AlbumReflashIcon"]];
    spinningView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:spinningView];
    self.spinningView = spinningView;
    
    self.rotateAnimation = [[CABasicAnimation alloc] init];
    self.rotateAnimation.keyPath = @"transform.rotation.z";
    self.rotateAnimation.fromValue = @0;
    self.rotateAnimation.toValue = @(M_PI * 2);
    self.rotateAnimation.duration = 1.0;
    self.rotateAnimation.repeatCount = MAXFLOAT;
    
    self.mj_y = -self.mj_h - self.ignoredScrollViewContentInsetTop;
}

#pragma mark 在这里设置子控件的位置和尺寸
/*这个方法会在下拉状态被不停地调用..*/
- (void)placeSubviews
{
    [super placeSubviews];
    
    //这里用frame的话下拉旋转的时候会变大变小..日了狗了
    self.spinningView.bounds = CGRectMake(0, 0, kSpinningSize, kSpinningSize);
    self.spinningView.center = CGPointMake(kSpinningPosition, kSpinningPosition);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary*)change
{
    [super scrollViewContentOffsetDidChange:change];
    
    self.mj_y = -self.mj_h - self.ignoredScrollViewContentInsetTop;
    
    CGFloat pullingY = fabs(self.scrollView.mj_offsetY + 64 +
                            self.ignoredScrollViewContentInsetTop);
    if (pullingY >= kViewHeight) {
        CGFloat marginY = -kViewHeight - (pullingY - kViewHeight) -
        self.ignoredScrollViewContentInsetTop;
        self.mj_y = marginY;
    }
    
    CGFloat rotateAngle = pullingY / kViewHeight * M_PI;
    CGAffineTransform transform = CGAffineTransformIdentity;
    //设置旋转角度
    transform = CGAffineTransformRotate(transform, rotateAngle);
    
    self.spinningView.transform = transform;
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary*)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary*)change
{
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            // 3. 停止转圈
            [self.spinningView.layer removeAnimationForKey:kRotateAnimationKey];
            break;
        case MJRefreshStatePulling:
            break;
        case MJRefreshStateRefreshing:
            // 2. 一直转圈
            [self.spinningView.layer addAnimation:self.rotateAnimation
                                           forKey:kRotateAnimationKey];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}

@end
