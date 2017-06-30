//
//  BallView.h
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/27.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"

@interface BallView : BaseView
///颜色  可设置
@property (nonatomic, strong) UIColor *ballColor;
///半径  可设置
@property (nonatomic, assign) CGFloat ballRadius;
///与水平向上箭头的运动方向的夹角 默认开始为 π/4 可设置
@property (nonatomic, assign) CGFloat ballAngle;
///速度 可设置 50px/s 0.5px/0.01s
@property (nonatomic, assign) CGFloat ballSpeed;
///计时器
//@property (nonatomic, strong) NSTimer *ballTimer;
///球数组
//@property (nonatomic, strong) NSMutableArray *ballArr;

///工厂类方法 获得一个球
+ (instancetype)createABallInstance;
@end
