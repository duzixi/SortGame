//
//  MenuViewController.m
//  SortGame
//
//  Created by 杜子兮(duzix) on 14-8-5.
//  Copyright (c) 2014年 lanou. All rights reserved.
//

#import "MenuViewController.h"
#import "BubbleSortViewController.h"
#import "SelectionSortViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arrTitle = @[@"冒泡排序      Bubble Sort",
                          @"选择排序   Selection Sort",
                          @"插入排序   Insertion Sort",
                          @"自由排序        Free Sort"];
    for (int i = 0; i < [arrTitle count]; i++) {
        UIButton * btBubbleSort = [UIButton buttonWithType:UIButtonTypeCustom];
        btBubbleSort.tag = 100 + i;
        btBubbleSort.frame = CGRectMake(40, 50 + (40 + 10) * i, 300, 40);
        [btBubbleSort.layer setMasksToBounds:YES];
        [btBubbleSort.layer setCornerRadius:20];
        [btBubbleSort setTitle:arrTitle[i] forState:UIControlStateNormal] ;
        UIFont *font = [UIFont fontWithName:@"Trebuchet-BoldItalic" size:20];
        [btBubbleSort.titleLabel setFont:font];
        [btBubbleSort setTitleColor:[WebColor darkSlateBlue] forState:UIControlStateNormal];
        [btBubbleSort setBackgroundColor:[WebColor lavender]];
        [btBubbleSort addTarget:self action:@selector(startBubbleSort:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btBubbleSort];
        
    }
}

- (void)startBubbleSort:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {
            BubbleSortViewController *bubbleSort = [[[BubbleSortViewController alloc] init] autorelease];
            [self presentViewController:bubbleSort animated:YES completion:^{
                
            }];
        }
            break;
        case 101:
        {
            SelectionSortViewController *selectionSort = [[[SelectionSortViewController alloc] init] autorelease];
            [self presentViewController:selectionSort animated:YES completion:^{
                
            }];
        }
            break;
        default:
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
