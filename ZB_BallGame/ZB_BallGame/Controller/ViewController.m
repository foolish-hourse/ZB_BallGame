//
//  ViewController.m
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/27.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "ViewController.h"
#import "BallView.h"
#import "BallLogicalModel.h"

@interface ViewController ()
///存储小球数组
@property (nonatomic, strong) NSMutableArray *ballArr;
@end

@implementation ViewController
#pragma mark - lazy load
- (NSMutableArray *)ballArr {
    if (!_ballArr) {
        _ballArr = [NSMutableArray new];
    }
    return _ballArr;
}

#pragma mark - view Func
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加手势
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    tapGr.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGr];
    
    //创建一个运动环境
    [self createTimer];
}

#pragma mark - methods
///创建一个运动环境
- (void)createTimer {
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(moveTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

#pragma mark - timer
- (void)moveTimer:(NSTimer *)timer {
    for (int i = 0; i < self.ballArr.count; i++) {
        BallView *ballView = self.ballArr[i];
        //单个小球碰撞四壁逻辑
        [BallLogicalModel dealRoundKnockBall:ballView];
        
//        if (self.ballArr.count > 1 && i < self.ballArr.count - 1) {//多于一个球
//            //两个小球碰撞逻辑
//            BallView *oneBallView = self.ballArr[i];
//            BallView *twoBallView = self.ballArr[i + 1];
//            [BallLogicalModel dealTwoKnockBall:oneBallView twoBallView:twoBallView];
//        }
    }
}

#pragma mark - SEL
- (void)tapClick:(UITapGestureRecognizer *)tapGr {
    CGPoint location = [tapGr locationInView:self.view];
    //创建小球
    BallView *ballView = [BallView createABallInstance];
    ballView.ballRadius = 15;
    ballView.ballColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
    
    [self.view addSubview:ballView];
    [self.ballArr addObject:ballView];
    ballView.center = location;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
}

@end
