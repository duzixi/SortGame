//
//  BubbleSortViewController.h
//  冒泡排序
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleSortViewController : UIViewController <UIAlertViewDelegate>
{
    NSInteger       _i;
    NSInteger       _j;
    NSDate         *_startTime;
    NSTimer        *_timer;
    NSInteger       _wrongTime;
    UILabel        *_wrongLabel;
    NSTimeInterval  _usedTime;
}

@property(nonatomic, retain) NSMutableArray *array;

@end
