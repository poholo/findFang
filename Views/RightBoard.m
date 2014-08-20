//
//  RightBoard.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 lp_马建成. All rights reserved.
//

#import "RightBoard.h"
#define PLAY_MODE @[@"正常模式",@"疯癫模式"]
@implementation RightBoard

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _delegate = delegate;
        _lbUseTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, frame.size.width, 40)];
        _lbUseTime.backgroundColor = [UIColor clearColor];
        _lbUseTime.text = @"准备计时...";
        _lbUseTime.textAlignment = NSTextAlignmentCenter;
        
        
        _lbSlider = [[UILabel alloc] initWithFrame:CGRectMake(0, _lbUseTime.frame.origin.y + _lbUseTime.frame.size.height, _lbUseTime.frame.size.width, _lbUseTime.frame.size.height)];
        _lbSlider.textAlignment = NSTextAlignmentCenter;
        _lbSlider.text = @"正常模式";
        _lbSlider.backgroundColor = [UIColor clearColor];
        _switch = [[UISwitch alloc] initWithFrame:CGRectMake(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?50:20),
                                                            _lbSlider.frame.origin.y + _lbSlider.frame.size.height,
                                                            60, _lbSlider.frame.size.height)];
        
        [_switch addTarget:self action:@selector(sliderChange) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_lbUseTime];
        [self addSubview:_lbSlider];
        [self addSubview:_switch];
    }
    return self;
}

-(void)sliderChange{
    _lbSlider.text = PLAY_MODE[_switch.on];
    if([_delegate respondsToSelector:@selector(playModelChange:)]){
        [_delegate playModelChange:_switch.on];
    }
}
-(void)changeTime:(int)timeGo{
    _lbUseTime.text = [NSString stringWithFormat:@"用时%ds",timeGo];
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
