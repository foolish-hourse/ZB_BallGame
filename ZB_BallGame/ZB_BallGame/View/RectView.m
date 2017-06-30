//
//  RectView.m
//  ZB_BallGame
//
//  Created by YZL on 17/6/30.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "RectView.h"

@implementation RectView {
    CGPoint _beginPoint;
    CGPoint _endPoint;
}

#pragma mark - factory methods
///工厂类方法 获得一个球
+ (instancetype)createARectInstance {
    return [[self alloc] init];
}

#pragma mark - init
- (instancetype)init {
    if (self = [super init]) {
        //默认黑边，粗1
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        
        //添加长按移动手势
        UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGr:)];
        [self addGestureRecognizer:panGr];
        
    }
    return self;
}

#pragma mark - SEL
- (void)panGr:(UIPanGestureRecognizer *)panGr {
    CGPoint translation = [panGr translationInView:self.superview];
    self.center = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
    [panGr setTranslation:CGPointZero inView:self.superview];
}

@end
