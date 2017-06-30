//
//  ContainerView.m
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/30.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "ContainerView.h"
#import "RectView.h"

@implementation ContainerView {
///当前操作的矩形
    RectView *_currentRectView;
}

#pragma mark - lazy load
- (NSMutableArray *)ballArr {
    if (!_ballArr) {
        _ballArr = [NSMutableArray new];
    }
    return _ballArr;
}

- (NSMutableArray *)rectArr {
    if (!_rectArr) {
        _rectArr = [NSMutableArray new];
    }
    return _rectArr;
}

#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加长按移动手势
        UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGr:)];
        [self addGestureRecognizer:panGr];
    }
    return self;
}

#pragma mark - draw methods
//- (void)drawRect:(CGRect)rect {
////    NSLog(@"rect:%@",[NSValue valueWithCGRect:rect]);
//    UIColor *color = [UIColor blackColor];
//    [color set]; //设置线条颜色
//    
//    CGFloat rectWidth = fabs(self.endPoint.x - self.beginPoint.x);
//    CGFloat rectHeight = fabs(self.endPoint.y - self.beginPoint.y);
//    CGRect rectFrame = CGRectZero;
//    if (self.endPoint.x - ) {
//        
//    }
//    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(self.beginPoint.x, self.beginPoint.y, rectWidth, rectHeight)];
//    rectPath.lineWidth = 1;
////    rectPath.lineCapStyle = kCGLineCapRound; //线条拐角
////    rectPath.lineJoinStyle = kCGLineCapRound; //终点处理
//    [rectPath stroke];
//}

#pragma mark - SEL
- (void)panGr:(UIPanGestureRecognizer *)panGr {
    if (panGr.state == UIGestureRecognizerStateBegan) {
        CGPoint beginPoint = [panGr locationInView:self];
        NSLog(@"touchesBegan:%@",[NSValue valueWithCGPoint:beginPoint]);
        self.beginPoint = beginPoint;
        //开始初始化矩形view 并加入矩形
        RectView *rectView = [RectView createARectInstance];
        _currentRectView = rectView;
        [self addSubview:rectView];
        [self.rectArr addObject:rectView];
    }else if (panGr.state == UIGestureRecognizerStateChanged) {
        CGPoint endPoint = [panGr locationInView:self];
        NSLog(@"touchesMoved:%@",[NSValue valueWithCGPoint:endPoint]);
        CGPoint beginPoint = self.beginPoint;
        //确定起点和终点
        self.beginPoint = beginPoint;
        self.endPoint = endPoint;
        
        CGFloat rectWidth = fabs(self.endPoint.x - self.beginPoint.x);
        CGFloat rectHeight = fabs(self.endPoint.y - self.beginPoint.y);
        
        if (beginPoint.x <= endPoint.x && beginPoint.y <= endPoint.y) {
            _currentRectView.frame = CGRectMake(self.beginPoint.x, self.beginPoint.y, rectWidth, rectHeight);
        }else if (beginPoint.x > endPoint.x && beginPoint.y <= endPoint.y) {
            _currentRectView.frame = CGRectMake(self.endPoint.x, self.beginPoint.y, rectWidth, rectHeight);
        }else if (beginPoint.x <= endPoint.x && beginPoint.y > endPoint.y) {
            _currentRectView.frame = CGRectMake(self.beginPoint.x, self.endPoint.y, rectWidth, rectHeight);
        }else if (beginPoint.x > endPoint.x && beginPoint.y > endPoint.y) {
            _currentRectView.frame = CGRectMake(self.endPoint.x, self.endPoint.y, rectWidth, rectHeight);
        }
    }else if (panGr.state == UIGestureRecognizerStateEnded) {
        CGPoint endPoint = [panGr locationInView:self];
        NSLog(@"touchesEnded:%@",[NSValue valueWithCGPoint:endPoint]);
    }
}

@end
