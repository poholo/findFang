//
//  FindFangMainViewController.m
//  FindFang
//
//  Created by ma on 14-8-20.
//  Copyright (c) 2014年 ma. All rights reserved.
//


#import "FindFangMainViewController.h"
#import "FFBoard.h"
#import "LeftBord.h"
#import "RightBoard.h"
int vl[100]= {1,2, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8,8};
@interface FindFangMainViewController ()<FFPictureBoardDelegate,PlayModelDelegate>{
    
    LeftBord *_leftBoard;
    RightBoard *_rightBoard;
    
    FFBoard *_ffboard;
    RIGHT_STRUCT _right_struct;
    int _gamecut ;
    
    float _ffwidth ;
    float _ffx ;
    BOOL _isNormal;
    
    NSTimer *_timer;
    int _timeGo;
    
}
@end

@implementation FindFangMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
	// Do any additional setup after loading the view.
    [self initDataParam];
    [self initUI];
    
}
-(void)initDataParam{
    _gamecut = 0;
    _timeGo = 0;
    _ffwidth = [UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height;
    _ffx = ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.width)/2 -  _ffwidth/2 ;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeTick:) userInfo:nil repeats:YES];
}
-(void)initUI{
    _leftBoard = [[LeftBord alloc] initWithFrame:CGRectMake(0, 20, _ffx, _ffwidth)];
    [self.view addSubview:_leftBoard];
    [self changeFFboard];
    
    _rightBoard = [[RightBoard alloc] initWithFrame:CGRectMake(_ffboard.frame.origin.x  + _ffboard.frame.size.width -40 , 20, _ffx +40, _ffwidth) delegate:self];

    [self.view addSubview:_rightBoard];
    
#if DEBUG
    _leftBoard.layer.borderColor = [UIColor redColor].CGColor;
    _leftBoard.layer.borderWidth = 1;
    
    _rightBoard.layer.borderColor = [UIColor greenColor].CGColor;
    _rightBoard.layer.borderWidth = 1;
    
    _ffboard.layer.borderColor = [UIColor blueColor].CGColor;
    _ffboard.layer.borderWidth = 1;
#endif
    
}

-(void)changeFFboard{
    if(_ffboard){
        [_ffboard removeFromSuperview];
        _ffboard = nil;
    }
    _ffboard = [[FFBoard alloc] initWithFrame:CGRectMake(_ffx,
                                                        0,
                                                        _ffwidth,
                                                        _ffwidth)
                                      gameCut:(_isNormal?_gamecut:vl[_gamecut])
                                   rightFFNum:0
                                     delegate:self];
    
    
    _right_struct = _ffboard.right_struct;
    
    [self.view addSubview:_ffboard];
}

-(void)timeTick:(id)sender{
    _timeGo ++;
    [_rightBoard changeTime:_timeGo];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
-(void)pictureBoardClick:(RIGHT_STRUCT)identify ffpicBoard:(FFPictureBoard *)ffpicBoard{
    bool isRight = (_right_struct.x==identify.x&&_right_struct.y==identify.y)?true:false;
    //right
    if(isRight){
        [ffpicBoard rightResponse];
        
        //next GameCut
        _gamecut++;
        [self changeFFboard];
        [_leftBoard setGameCut:_gamecut];
    }
    //error
    else{
        [ffpicBoard errorResponse];
    }
    
    
    
}

-(void)playModelChange:(BOOL)isNormal{
    _isNormal = isNormal;
}


#pragma mark - rota

@end
