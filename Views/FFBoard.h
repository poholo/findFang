//
//  FFBoard.h
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FFPictureBoardGroup.h"
@interface FFBoard : UIView
@property (nonatomic) RIGHT_STRUCT right_struct;
-(id)initWithFrame:(CGRect)frame gameCut:(int)gameCut rightFFNum:(int)rightFFNum delegate:(id)delegate;
@end
