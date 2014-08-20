//
//  FFBoard.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import "FFBoard.h"
#import "ColorUtils.h"
@interface FFBoard (){
    NSMutableArray *_ffpicBoardGroupArr;
}
@end

@implementation FFBoard

- (id)initWithFrame:(CGRect)frame
{
    return nil;
}
-(id)init{
    return nil;
}

-(id)initWithFrame:(CGRect)frame gameCut:(int)gameCut rightFFNum:(int)rightFFNum delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if(self){
        int row = gameCut +1;
        u_int32_t rx = arc4random();
        int rightX = rx%row;
        
        u_int32_t ry = arc4random();
        int rightY = ry%row;
        
        _right_struct.x = rightX;
        _right_struct.y = rightY;
                        
        _ffpicBoardGroupArr = [[NSMutableArray alloc] initWithCapacity:row];
        
        float width = frame.size.width;
        float height  = frame.size.height / row;
        UIColor *backColor = [ColorUtils randomOneColor];
        for(int i=0;i<row;i++){
            BOOL isHasRightFang = (i==rightY?YES:NO);
            
            FFPictureBoardGroup *ffpicboardGroup = [[FFPictureBoardGroup alloc] initWithFrame:CGRectMake(0,
                                                                                                        height*i,
                                                                                                        width,
                                                                                                        width)
                                                                               isHasRightFang:isHasRightFang
                                                                                      rightFF:rightX
                                                                                       colSum:row
                                                                                          row:i
                                                                                    backColor:backColor
                                                                                     delegate:delegate];
            
            [_ffpicBoardGroupArr addObject:ffpicboardGroup];
            [self addSubview:ffpicboardGroup];
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
