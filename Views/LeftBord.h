//
//  LeftBord.h
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 lp_马建成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftBord : UIView{
    UILabel *_lbGameCut;
    UILabel *_lbGameTop;
    UILabel *_lbGameBottom;
    UILabel *_lbGameVl;
}
-(void)setGameCut:(int)gameCut;
@end
