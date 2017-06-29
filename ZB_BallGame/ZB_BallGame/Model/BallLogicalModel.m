//
//  BallLogicalModel.m
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/27.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BallLogicalModel.h"

@implementation BallLogicalModel

///处理球碰撞四壁的逻辑
+ (void)dealRoundKnockBall:(BallView *)ballView {
    CGPoint centerPoint = ballView.center;
    CGFloat ballRadius = ballView.ballRadius;
    
    if (centerPoint.y - ballRadius <= 0) {
        ballView.ballAngle = 2 * M_PI - ballView.ballAngle;
    }
    
    if (centerPoint.x - ballRadius <= 0) {
        ballView.ballAngle = M_PI - ballView.ballAngle;
    }
    
    if (centerPoint.y + ballRadius >= SCREEN_HEIGHT) {
        ballView.ballAngle = 2 * M_PI - ballView.ballAngle;
    }
    
    if (centerPoint.x + ballRadius >= SCREEN_WIDTH) {
        ballView.ballAngle = M_PI - ballView.ballAngle;
    }
    
    ballView.x = ballView.x + ballView.ballSpeed * 0.01 * cos(ballView.ballAngle);
    ballView.y = ballView.y - ballView.ballSpeed * 0.01 * sin(ballView.ballAngle);
}

/////处理两个小球之间的碰撞逻辑
//+ (void)dealTwoKnockBall:(BallView *)oneBallView twoBallView:(BallView *)twoBallView {
//    CGPoint oneBallCenterPoint = oneBallView.center;
//    CGFloat oneBallRadius = oneBallView.ballRadius;
//    
//    CGPoint twoBallCenterPoint = twoBallView.center;
//    CGFloat twoBallRadius = twoBallView.ballRadius;
//    
//    
//    CGFloat verLength = fabs(oneBallCenterPoint.y - twoBallCenterPoint.y);
//    CGFloat horLength = fabs(oneBallCenterPoint.x - twoBallCenterPoint.x);
//    
//    
//    if (sqrt(verLength * verLength + horLength * horLength) <= oneBallRadius + twoBallRadius) {//勾股定理判断球心距是否小于等于两者半径和，若是，即碰撞
//        oneBallView.ballAngle = oneBallView.ballAngle - M_PI;
//        oneBallView.x = oneBallView.x + oneBallView.ballSpeed * 0.01 * cos(oneBallView.ballAngle);
//        oneBallView.y = oneBallView.y - oneBallView.ballSpeed * 0.01 * sin(oneBallView.ballAngle);
//        
//        twoBallView.ballAngle = twoBallView.ballAngle - M_PI;
//        twoBallView.x = twoBallView.x + twoBallView.ballSpeed * 0.01 * cos(twoBallView.ballAngle);
//        twoBallView.y = twoBallView.y - twoBallView.ballSpeed * 0.01 * sin(twoBallView.ballAngle);
//    }
//}
@end
