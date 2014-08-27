//
//  SelectionSortViewController.h
//  选择排序
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionSortViewController : UIViewController
{
    NSInteger       _i;
    NSInteger       _j;
    NSDate         *_startTime;
    NSTimer        *_timer;
    NSInteger       _wrongTime;
    UILabel        *_wrongLabel;
    NSTimeInterval  _usedTime;
    NSInteger       _currentMin;
}

@property(nonatomic, retain) NSMutableArray *array;

@end
