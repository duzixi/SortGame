//
//  SelectionSortViewController.m
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import "SelectionSortViewController.h"
#import "Sort.h"
#import "View.h"
#import "Audio.h"

@interface SelectionSortViewController ()

@end

@implementation SelectionSortViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // 生成一个随机数组，包含10个数
        self.array = [Sort createRandomArray];
        _i = 0;
        // 下标指向第一个元素
        _j = 0;
        // 算出最小的元素
        _currentMin = 100;
        for (int i = 0; i < 10; i++) {
            if ([self.array[i] intValue]  < _currentMin) {
                _currentMin = [self.array[i] intValue];
            }
        }
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:nil error:nil];
        [player prepareToPlay];
        [player play];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 0. 给个背景色
    self.view.backgroundColor = [WebColor azure];
    // 1. 根据数组生成10个UIView,UILabel
    [View createColumnsOn:self with:self.array style:SortTypeSelection];
    
    // 2. 添加两个按钮
    [View createNextButtonOn:self];
    [View createSwapButtonOn:self];
    
    // 3. 添加⌛️标签
    [View createTimerLabelOn:self];
    
    // 4. 添加记错标签 ❌
    [View createWrongTimeLabelOn:self];
    _wrongLabel = (UILabel *)[self.view viewWithTag:3002];
    
    // 5. 添加额外修饰内容
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 30)];
    titleLabel.text = @"Selection Sort";
    titleLabel.textColor = [WebColor darkSlateBlue];
    UIFont *font2 = [UIFont fontWithName:@"Trebuchet-BoldItalic" size:20];
    [titleLabel setFont:font2];
    [self.view addSubview:titleLabel];
    
    // 计时开始！
     _startTime = [[NSDate alloc] init];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

///  计时
- (void)timer
{
    UILabel *timerLabel = (UILabel *)[self.view viewWithTag:3001];
    NSDate *currentTime = [NSDate date];
    _usedTime = [currentTime timeIntervalSinceDate:_startTime];
    timerLabel.text = [NSString stringWithFormat:@"⌛️所用时间:%4d秒", (int)_usedTime];
}

///  记错
- (void)wrong
{
    NSLog(@"Wrong!");
    
    //添加音频
    [Audio sound:@"wrong"];
    _wrongTime++;
    _wrongLabel.text = [NSString stringWithFormat:@"❌出错次数：%d次", _wrongTime];
}

///  右移
- (void)goNext
{
    if ([self.array[_j] intValue] == _currentMin) {
        [self wrong];
        return;
    }

    //添加音频
    [Audio sound:@"next"];

    // 改变第_j个柱子的颜色
    UIView *viewJ = [self.view viewWithTag:(_j + 1000)];
    viewJ.backgroundColor = [WebColor cornflowerBlue];
    UIView *viewJ2 = [self.view viewWithTag:(_j + 1000 + 1)];
    viewJ2.backgroundColor = [WebColor deepPink];
    
    _j++;
}


///  选择并交换
- (void)swap
{
    if (_i >= 10) {
        return;
    }
    
    // 判断是否完成游戏
    if (_i == 10 - 1) {
        _i++;
        NSLog(@"Well Done!");
        //添加音频
        [Audio sound:@"win"];
        
        if ([_timer isValid]) {
            [_timer invalidate];
            _timer = nil;
        }
        // 改变最后一个柱子的颜色
        UIView *viewJ = [self.view viewWithTag:(1000 + 10 - 1)];
        viewJ.backgroundColor = [WebColor darkSlateBlue];
        NSString *msg = @"恭喜你在%d秒内完成了选择排序（共出错%d次）。\n本版本为测试版本，正式版本更加精彩，敬请期待！";
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"恭喜！"
                                   message:[NSString stringWithFormat:msg,
                                            (int)_usedTime, _wrongTime]
                                  delegate:self
                         cancelButtonTitle:@"好的"
                         otherButtonTitles:nil, nil];
        alert.delegate = self;
        [self performSelector:@selector(showAlert:) withObject:alert afterDelay:1.0];
        return;
    }
    
    if ([self.array[_j] intValue] != _currentMin) {
        [self wrong];
        return;
    }
    
    NSLog(@"Swap!");
    
    //添加音频
    [Audio sound:@"swap"];
    
    if (_i != _j) {
        // 改变第_i个柱子和第_j个柱子的高度和标签高度
        [View swapColumnsOn:self atIndex:_i and:_j];
        [self.array exchangeObjectAtIndex:_i withObjectAtIndex:_j];
        
        UIView *viewI = [self.view viewWithTag:(_i + 1000)];
        UIView *viewJ = [self.view viewWithTag:(_j + 1000)];
        // 改变第i个柱子的颜色
        viewI.backgroundColor = [WebColor darkSlateBlue];
        // 改变第j个柱子的颜色
        viewJ.backgroundColor = [WebColor cornflowerBlue];
        
        // 选中下一个柱子
        _i++;
        _j = _i;
        viewI = [self.view viewWithTag:_j + 1000];
        viewI.backgroundColor = [WebColor deepPink];

    } else if (_i == _j) {
        UIView *viewI = [self.view viewWithTag:_i + 1000];
        // 改变第i个柱子的颜色
        viewI.backgroundColor = [WebColor darkSlateBlue];
        _i++;
        _j = _i;
        viewI = [self.view viewWithTag:_j + 1000];
        viewI.backgroundColor = [WebColor deepPink];
    }
    
    _currentMin = [Sort minValueInArray:self.array from:_i];
    
}

- (void)showAlert:(UIAlertView *)alert
{
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:^{}];
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
