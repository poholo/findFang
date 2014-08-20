//
//  RightBoard.h
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 lp_马建成. All rights reserved.
//
@protocol PlayModelDelegate <NSObject>

-(void)playModelChange:(BOOL)isNormal;

@end
#import <UIKit/UIKit.h>

@interface RightBoard : UIView{
    UILabel *_lbUseTime;
    UILabel *_lbSlider;
    UISwitch *_switch;
    
    id<PlayModelDelegate> _delegate;
}
-(id)initWithFrame:(CGRect)frame delegate:(id)delegate;
-(void)changeTime:(int)timeGo;
@end
