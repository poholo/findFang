//
//  FFPictureBoard.h
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//
@class FFPictureBoard;
@protocol FFPictureBoardDelegate <NSObject>

-(void)pictureBoardClick:(RIGHT_STRUCT)identify ffpicBoard:(FFPictureBoard*)ffpicBoard;

@end

#import <UIKit/UIKit.h>

@interface FFPictureBoard : UIView{
    UIImageView *_imgFFPic;
    RIGHT_STRUCT _identify;
    id<FFPictureBoardDelegate> _delegate;
    UIColor *_currentNormalColor;
}
-(id)initWithFrame:(CGRect)frame ffpic:(NSString*)ffpicName backColor:(UIColor*)backColor identify:(RIGHT_STRUCT)identify ffpictureBoardDelegate:(id)delegate;
-(void)rightResponse;
-(void)errorResponse;
@end
