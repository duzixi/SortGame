//
//  Sort.h
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject

///  生成随机数组
+ (NSMutableArray *) createRandomArray;

///  返回数组中的最小值
+ (NSInteger) minValueInArray:(NSArray *)array from:(NSInteger)i;

@end
