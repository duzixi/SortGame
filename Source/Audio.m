//
//  Audio.m
//  SortGame
//
//  Created by 杜子兮(duzixi) on 14-8-16.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技 All rights reserved.
//

#import "Audio.h"

@implementation Audio

+ (void) sound:(NSString *)name
{
    //添加音频
    NSString *songPath = [[NSBundle mainBundle]pathForResource:name ofType:@"mp3"];
    NSURL *songUrl = [NSURL fileURLWithPath:songPath];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:songUrl error:nil];
    [player prepareToPlay];
    [player play];
}

@end
