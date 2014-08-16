//
//  Sort.m
//  SortGame
//
//  Created by 杜子兮(duzix) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com All rights reserved.
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

@end
