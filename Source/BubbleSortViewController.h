//
//  BubbleSortViewController.h
//  冒泡排序
//  SortGame
//
//  Created by 杜子兮(duzix) on 14-8-2.
//  Copyright (c) 2014年 lanou. All rights reserved.
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
