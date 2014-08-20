//
//  FFPictureBoard.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import "FFPictureBoard.h"

@implementation FFPictureBoard

- (id)initWithFrame:(CGRect)frame
{
    return nil;
}

-(id)init{
    return nil;
}
-(id)initWithFrame:(CGRect)frame ffpic:(NSString *)ffpicName backColor:(UIColor *)backColor identify:(RIGHT_STRUCT)identify ffpictureBoardDelegate:(id)delegate{
    self = [super initWithFrame:frame];
    if(self){
        _delegate = delegate;
        _identify = identify;
        _currentNormalColor = backColor;
        
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.layer.backgroundColor = backColor.CGColor;
        self.layer.masksToBounds = YES;
        
        
        _imgFFPic = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgFFPic.image = [UIImage imageNamed:ffpicName];
        _imgFFPic.userInteractionEnabled = YES;
        [self addSubview:_imgFFPic];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectFFPicBoard:)];
        [_imgFFPic addGestureRecognizer:tap];
        
    }
    return self;

}

-(void)selectFFPicBoard:( id)sender{
    
    if([_delegate respondsToSelector:@selector(pictureBoardClick:ffpicBoard:)]){
        [_delegate pictureBoardClick:_identify ffpicBoard:self];
    }
        
}

-(void)rightResponse{
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(normalResponse) userInfo:nil repeats:NO];
}

-(void)errorResponse{
    
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(normalResponse) userInfo:nil repeats:NO];
}
-(void)normalResponse{
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.backgroundColor = _currentNormalColor.CGColor;
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
