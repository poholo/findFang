//
//  FFPictureBoardGroup.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import "FFPictureBoardGroup.h"

#define FF_PIC_ARR @[@"0.png",@"1.png"]
@implementation FFPictureBoardGroup

- (id)initWithFrame:(CGRect)frame
{
    return nil;
}
-(id)init{
    return nil;
}

-(id)initWithFrame:(CGRect)frame isHasRightFang:(BOOL)isHasRightFang rightFF:(int)rightFFNum colSum:(int)colSum row:(int)row backColor:(UIColor *)backColor delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if(self){
        _row = row;
        _ffpictureArr = [[NSMutableArray alloc] initWithCapacity:colSum];
        
        float width = frame.size.width*.8 / colSum;
        float splitX = frame.size.width*.1/(colSum+1);
        
        for(int i=0;i<colSum;i++){
            
            RIGHT_STRUCT right_struct;
            right_struct.x = i;
            right_struct.y = row;
            FFPictureBoard *ffpicBoard = [[FFPictureBoard alloc] initWithFrame:CGRectMake(i*width + splitX*(i+1),
                                                                                         splitX,
                                                                                         width,
                                                                                         width)
                                                                        ffpic:(i==rightFFNum?FF_PIC_ARR[isHasRightFang]:FF_PIC_ARR[0])
                                                                    backColor:backColor
                                                                     identify:right_struct
                                                       ffpictureBoardDelegate:delegate];
            
            [_ffpictureArr addObject:ffpicBoard];
            [self addSubview:ffpicBoard];
        }
    }
    return self;
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
