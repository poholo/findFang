//
//  LeftBord.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 lp_马建成. All rights reserved.
//
#define VL_ARR @[@"龙叔的脑残粉", @"龙叔的忠实粉", @"龙叔的路人粉", @"慧眼识祖名", @"火眼金睛", @"洞察一切", @"两眼冒光", @"24k氪金眼", @"已被亮瞎！",@"自古英雄出少年",@"经天纬地之才",@"定国安邦之智",@"卧龙凤雏得一而安天下",@"飞沙走石,大舞迷天",@"朦胧中,只见顶天立地一金甲天神立于天地间",@"小生对玩家之仰慕如滔滔江水连绵不绝",@"海枯石烂,天崩地裂,永不变心",@"你的高尚情操太让人感动了。在现在这样一个物欲横流的金钱社会里，竟然还能见到你这样的性情中人",@"无疑是我这辈子最大的幸运。让我深深感受到了人性的伟大",@"高大威猛",@"英俊潇洒 风流倜傥",@"人见人爱 花见花开",@"车见车栽才高八斗",@"学富五车，玉树临风",@"英俊潇洒，风流倜傥",@"貌似潘安，人称一朵梨花压海棠",@"帅的掉渣，乾坤无敌，迷倒千万少女",@"当年抛弃林青霞，甩掉戴安娜，人称情场杀手鬼见愁的就是你"]

#import "LeftBord.h"

@implementation LeftBord

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        _lbGameTop = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, frame.size.width, 40)];
        _lbGameTop.text = @"当前第";
        _lbGameTop.textColor = [UIColor darkGrayColor];
        _lbGameTop.backgroundColor = [UIColor clearColor];
        
        
        _lbGameCut = [[UILabel alloc] initWithFrame:CGRectMake(0, _lbGameTop.frame.origin.y + _lbGameTop.frame.size.height, _lbGameTop.frame.size.width, _lbGameTop.frame.size.height)];
        _lbGameCut.backgroundColor = [UIColor clearColor];
        _lbGameCut.textColor = [UIColor redColor];
        _lbGameCut.text = @"1";
        _lbGameBottom = [[UILabel alloc] initWithFrame:CGRectMake(0, _lbGameCut.frame.origin.y + _lbGameCut.frame.size.height, _lbGameCut.frame.size.width, _lbGameCut.frame.size.height)];
        _lbGameBottom.text = @"关";
        _lbGameBottom.textColor = [UIColor darkGrayColor];
        _lbGameBottom.backgroundColor = [UIColor clearColor];
        
        _lbGameTop.textAlignment = NSTextAlignmentCenter;
        _lbGameCut.textAlignment = NSTextAlignmentCenter;
        _lbGameBottom.textAlignment = NSTextAlignmentCenter;
        
        _lbGameVl = [[UILabel alloc] initWithFrame:CGRectMake(0, _lbGameBottom.frame.origin.y + _lbGameBottom.frame.size.height, _lbGameBottom.frame.size.width, _lbGameBottom.frame.size.height*2)];
        _lbGameVl.backgroundColor = [UIColor clearColor];
        _lbGameVl.textColor = [UIColor darkGrayColor];
        _lbGameVl.font = [UIFont boldSystemFontOfSize:15];
        _lbGameVl.textAlignment = NSTextAlignmentCenter;
        _lbGameVl.text = @"初入江湖";
        _lbGameVl.numberOfLines = 4;
        
        
        
        [self  addSubview:_lbGameTop];
        [self addSubview:_lbGameCut];
        [self addSubview:_lbGameBottom];
        [self addSubview:_lbGameVl];
        
        
        
    }
    return self;
}

-(void)setGameCut:(int)gameCut{
    _lbGameCut.text = [NSString stringWithFormat:@"%d",gameCut+1];
    if([VL_ARR count]<=gameCut){
        _lbGameVl.text = [VL_ARR lastObject];
    }
    else{
        _lbGameVl.text = VL_ARR[gameCut];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
