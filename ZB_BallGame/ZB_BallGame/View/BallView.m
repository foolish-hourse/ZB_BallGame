//
//  BallView.m
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/27.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BallView.h"

//#import "BallLogicalModel.h"

@implementation BallView

#pragma mark - factory methods
///工厂类方法 获得一个球
+ (instancetype)createABallInstance {
    return [[self alloc] init];
}

#pragma mark - init methods
- (instancetype)init {
    if (self = [super init]) {
        //默认颜色 黑色
        self.ballColor = [UIColor blackColor];
        //默认大小 10 X 10
        self.ballRadius = 10;
        //运动角度 默认开始为 π/4
        self.ballAngle = M_PI / 6;
        //移动速度 500
        self.ballSpeed = 500;
        //计时器
//        _ballTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ballTimer:) userInfo:nil repeats:YES];
    }
    return self;
}

//#pragma mark - timer
//- (void)ballTimer:(NSTimer *)timer {
//    [BallLogicalModel dealRoundKnockBall:self];
//    if (self.ballArr.count > 1) {
//        for (int i = 0; i < self.ballArr.count; i++) {
//            BallView *ballView = self.ballArr[i];
//            if (ballView != self) {
//                [BallLogicalModel dealTwoKnockBall:self twoBallView:ballView];
//            }
//        }
//    }
//}

#pragma mark - set methods
///颜色  可设置
- (void)setBallColor:(UIColor *)ballColor {
    _ballColor = ballColor;
    self.backgroundColor = ballColor;
}
///半径  可设置
- (void)setBallRadius:(CGFloat)ballRadius {
    _ballRadius = ballRadius;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ballRadius * 2, ballRadius * 2);
    self.layer.cornerRadius = ballRadius;
    self.layer.masksToBounds = YES;
}
///与水平向上箭头的运动方向的夹角 默认开始为 π/4 可设置
- (void)setBallAngle:(CGFloat)ballAngle {
    _ballAngle = ballAngle;
}



@end
