//
//  View.m
//  SortGame
//
//  Created by 杜子兮(duzix) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com All rights reserved.
//

#import "View.h"

@implementation View

///  根据数组生成10个UIView,UILabel
+ (void) createColumnsOn:(UIViewController *)vc with:(NSArray *)array style:(SortType)sortType
{
    for (int i = 0; i < 10; i++) {
        CGFloat height = (vc.view.frame.size.width - OX) / 100.0 * [array[i] floatValue];
        UIView *view = [[UIView alloc] initWithFrame:
                        CGRectMake((WIDTH + MARGIN) * i + (vc.view.frame.size.height - (WIDTH + MARGIN) * 10 ) / 2.0,
                                   vc.view.frame.size.width - height - WIDTH * 2 - MARGIN,
                                   WIDTH,
                                   height) ];
        view.tag = 1000 + i;
        // 前n个柱子设为深粉红色
        int n = 0;
        switch (sortType) {
            case SortTypeBubble:
                n = 2;
                break;
            case SortTypeSelection:
                n = 1;
                break;
            default:
                break;
        }
        if (i < n) {
            view.backgroundColor = [WebColor deepPink];
        } else {
            view.backgroundColor = [WebColor cornflowerBlue];
        }
        [vc.view addSubview:view];
        
        UILabel *label = [[UILabel alloc] initWithFrame:
                          CGRectMake(view.frame.origin.x,
                                     view.frame.origin.y,
                                     WIDTH,
                                     WIDTH)];
        label.tag = 2000 + i;
        label.text = [NSString stringWithFormat:@"%d", [array[i] intValue]];
        [label setTextColor:[UIColor whiteColor]];
        label.textAlignment = NSTextAlignmentCenter;
        [vc.view addSubview:label];
    }
}

+ (void) createNextButtonOn:(UIViewController *)vc
{
    UIFont *font = [UIFont fontWithName:@"ArialMT" size:50];
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt1.titleLabel setFont:font];
    [bt1 setTitle:@"➡️" forState:UIControlStateNormal];
    [bt1 setBackgroundColor:[UIColor clearColor]];
    bt1.frame = CGRectMake(0, vc.view.frame.size.width - WIDTH * 2, WIDTH * 3, WIDTH * 2);
    [bt1 addTarget:vc action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:bt1];
}

///  生成Swap按钮
+ (void) createSwapButtonOn:(UIViewController *)vc
{
    UIFont *font = [UIFont fontWithName:@"ArialMT" size:50];
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt2.titleLabel setFont:font];
    [bt2 setTitle:@"🔄" forState:UIControlStateNormal];
    [bt2 setBackgroundColor:[UIColor clearColor]];
    bt2.frame = CGRectMake(vc.view.frame.size.height - WIDTH * 3,
                           vc.view.frame.size.width - WIDTH * 2,
                           WIDTH * 3,
                           WIDTH * 2);
    [bt2 addTarget:vc action:@selector(swap) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:bt2];
}

///  生成时间标签
+ (void) createTimerLabelOn:(UIViewController *)vc
{
    UILabel *timerLabel = [[UILabel alloc] initWithFrame:
                           CGRectMake(WIDTH * 3,
                                      vc.view.frame.size.width - WIDTH * 2,
                                      vc.view.frame.size.height - WIDTH * 2,
                                      WIDTH * 2)];
    timerLabel.tag = 3001;
    timerLabel.text = @"⌛️所用时间：";
    [vc.view addSubview:timerLabel];
}

///  生成记错标签
+ (void) createWrongTimeLabelOn:(UIViewController *)vc
{
    UILabel *label = [[UILabel alloc] initWithFrame:
                      CGRectMake(vc.view.frame.size.height / 2,
                                 vc.view.frame.size.width - WIDTH * 2,
                                 vc.view.frame.size.height,
                                 WIDTH * 2)];
    label.tag = 3002;
    label.text = @"❌出错次数：0次";
    [vc.view addSubview:label];
}


@end
