//
//  Sort.m
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import "Sort.h"

@implementation Sort

///  生成随机数组
+ (NSMutableArray *) createRandomArray
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        int n = arc4random() % 90 + 10;
        NSNumber *num = [[NSNumber alloc] initWithInt:n];
        [array addObject:num];
    }
    return array;
}

///  返回数组中的最小值
+ (NSInteger) minValueInArray:(NSArray *)array from:(NSInteger)index
{
    NSInteger min = [array[index] intValue];
    for (int i = index; i < 10; i++) {
        if (min > [array[i] intValue]) {
            min = [array[i] intValue];
        }
    }
    return min;
}

@end
