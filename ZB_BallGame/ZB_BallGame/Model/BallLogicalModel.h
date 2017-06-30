//
//  BallLogicalModel.h
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/27.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BallView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface BallLogicalModel : NSObject
///处理球碰撞四壁的逻辑
+ (void)dealRoundKnockBall:(BallView *)ballView;
///处理两个小球之间的碰撞逻辑
//+ (void)dealTwoKnockBall:(BallView *)oneBallView twoBallView:(BallView *)twoBallView;
@end
