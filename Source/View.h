//
//  View.h
//  SortGame
//
//  Created by 杜子兮(duzix) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface View : NSObject

///  根据数组生成10个UIView,UILabel
+ (void) createColumnsOn:(UIViewController *)vc with:(NSArray *)array style:(SortType)sortType;

///  生成Next按钮
+ (void) createNextButtonOn:(UIViewController *)vc;

///  生成Swap按钮
+ (void) createSwapButtonOn:(UIViewController *)vc;

///  生成时间标签
+ (void) createTimerLabelOn:(UIViewController *)vc;

///  生成记错标签
+ (void) createWrongTimeLabelOn:(UIViewController *)vc;

@end
