//
//  ContainerView.h
//  ZB_BallGame
//
//  Created by 洪冬介 on 2017/6/30.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"

@interface ContainerView : BaseView

///矩形起点
@property (nonatomic, assign) CGPoint beginPoint;
///矩形终点
@property (nonatomic, assign) CGPoint endPoint;

///存储小球数组
@property (nonatomic, strong) NSMutableArray *ballArr;
///存储举行数组
@property (nonatomic, strong) NSMutableArray *rectArr;

@end
