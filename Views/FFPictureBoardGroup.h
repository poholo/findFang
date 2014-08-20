//
//  FFPictureBoardGroup.h
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFPictureBoard.h"
@interface FFPictureBoardGroup : UIView{
    NSMutableArray *_ffpictureArr;
    int _row;
}
-(id)initWithFrame:(CGRect)frame isHasRightFang:(BOOL)isHasRightFang rightFF:(int)rightFFNum colSum:(int)colSum row:(int)row backColor:(UIColor*)backColor delegate:(id)delegate;

@end
