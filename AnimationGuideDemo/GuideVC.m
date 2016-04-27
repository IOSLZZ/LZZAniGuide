//
//  IntroduceVC.m
//  AnimationGuideDemo
//
//  Created by admin on 16/1/27.
//  Copyright © 2016年 LZZ. All rights reserved.
//
#import "GuideVC.h"
#import "UIView+ZAnimation.h"
@interface GuideVC ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pagCtr;
    NSInteger _curPage;
    NSArray *_bgColorArr;
    NSMutableArray *_titleArr;
    
    UIImageView * _guide_1_earthImg;
    UIImageView * _guide_1_mascotImg;
    NSMutableArray *_page1StarArr;
    NSMutableArray *_page1PaopaoArr;
    
    
    UIImageView *_guide_2_bgImg;
    UIImageView *_guide_2_successImg;
    NSMutableArray *_page2PaopaoArr;
    
    UIImageView * _guide_3_Light_rightImg;
    UIImageView * _guide_3_mascotImg;
    UIImageView * _guide_3_Light_leftImg;
    UIImageView * _guide_3_podiumImg;
    NSMutableArray *_page3StarArr;
   
}
@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSString *verson = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey];
    NSString *oldVerson=@"1.0.1";
    if(![verson isEqualToString:oldVerson]){
       
        [self addScrollView];
        [self addBgImg];
        
        [self setUpPage_1];
    }
    else{
         // Do any additional setup after loading the view.
    }

}
#pragma mark Lazy Loading
-(void)setUpPage_1{
    if (_guide_1_earthImg==nil) {
        _guide_1_earthImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100*KHEIGHT_Scale, SCREEN_WIDTH, SCREEN_WIDTH*660/747)];
        _guide_1_earthImg.image = [UIImage imageNamed:@"Guide_1_earth.png"];
        [_scrollView addSubview:_guide_1_earthImg];
    }
  
    if (_guide_1_mascotImg==nil) {
        CGFloat mascotWidth=140;
        _guide_1_mascotImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-mascotWidth/2,CGRectGetHeight(_guide_1_earthImg.frame)-mascotWidth*296/275+CGRectGetMinY(_guide_1_earthImg.frame)-5, mascotWidth, mascotWidth*296/275)];
        _guide_1_mascotImg.image = [UIImage imageNamed:@"Guide_1_mascot.png"];
        [_scrollView addSubview:_guide_1_mascotImg];
    }
   
    if(_page1StarArr==nil){
        _page1StarArr=[NSMutableArray array];
        for (int i=0; i<5; i++) {
            UIImageView *starImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Guide_1_star.png"]];
            
            switch (i) {
                case 0:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2-30, 230*KHEIGHT_Scale, 15, 15);
                }
                    break;
                case 1:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2+40, 180*KHEIGHT_Scale, 8, 8);
                }
                    break;
                case 2:
                { starImg.frame=CGRectMake(SCREEN_WIDTH/2+30, 160*KHEIGHT_Scale, 10, 10);
                    
                }
                    break;
                case 3:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2+85, 260*KHEIGHT_Scale, 15, 15);
                }
                    break;
                    
                default:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2-70, 240*KHEIGHT_Scale, 10, 10);
                }
                    break;
            }
            starImg.alpha=0;
            [_scrollView addSubview:starImg];
            [_page1StarArr addObject:starImg];
        }
    }
    if(_page1PaopaoArr==nil){
        _page1PaopaoArr=[NSMutableArray array];
        for (int i=0; i<6; i++) {
            UIImageView *starImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"Guide_1_paopao%d.png",i+1]]];
            
            switch (i) {
                case 0:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2-170*KWidth_Scale, 220*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale*147/156.0);
                }
                    break;
                case 1:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2-120*KWidth_Scale, 140*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale*167/188.0);
                }
                    break;
                case 2:
                { starImg.frame=CGRectMake(SCREEN_WIDTH/2-40*KWidth_Scale, 70*KHEIGHT_Scale, 60*KWidth_Scale, 60*KWidth_Scale*212/177.0);
                    
                }
                    break;
                case 3:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2+50*KWidth_Scale,110*KHEIGHT_Scale, 40*KWidth_Scale, 40*KWidth_Scale);
                }
                    break;
                case 4:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2+100*KWidth_Scale, 160*KHEIGHT_Scale, 40*KWidth_Scale, 40*KWidth_Scale*144/120.0);
                }
                    break;
                case 5:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH/2+110*KWidth_Scale, 220*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale);
                }
                    break;
            }
            starImg.alpha=0;
            
            [_scrollView addSubview:starImg];
            [_page1PaopaoArr addObject:starImg];
        }
        
    }

    _guide_1_mascotImg.alpha=0;
    _guide_1_earthImg.alpha=0;
    for (__weak UIImageView *imgView in _page1StarArr) {
        imgView.alpha=0;
    }
    [self animationPage1];
}
-(void)setUpPage_2{
    if (_guide_2_bgImg==nil) {
        _guide_2_bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*1+40*KWidth_Scale, 130*KHEIGHT_Scale, SCREEN_WIDTH-40*KWidth_Scale*2, (SCREEN_WIDTH-40*KWidth_Scale*2)*911/956)];
        _guide_2_bgImg.image = [UIImage imageNamed:@"Guide_2_bg.png"];
        [_scrollView addSubview:_guide_2_bgImg];
    }
    if (_guide_2_successImg==nil) {
        _guide_2_successImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2-20*KWidth_Scale, 100*KHEIGHT_Scale, KWidth_Scale*100, KWidth_Scale*110*221/348.0)];
        _guide_2_successImg.image = [UIImage imageNamed:@"Guide_2_success.png"];
        [_scrollView addSubview:_guide_2_successImg];
    }
    if(_page2PaopaoArr==nil){
        _page2PaopaoArr=[NSMutableArray array];
        for (int i=0; i<7; i++) {
            UIImageView *starImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"Guide_2_paopao%d.png",i+1]]];
            
            switch (i) {
                case 0:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2-150*KWidth_Scale, 250*KHEIGHT_Scale, 40*KWidth_Scale, 40*KWidth_Scale*147/156.0);//派对
                }
                    break;
                case 1:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2-145*KWidth_Scale, 190*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale*167/188.0);//野营
                }
                    break;
                case 2:
                { starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2-100*KWidth_Scale, 120*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale*212/177.0);//滑雪
                    
                }
                    break;
                case 3:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2-5*KWidth_Scale,85*KHEIGHT_Scale, 30*KWidth_Scale, 30*KWidth_Scale*125/105.0);//二楼
                }
                    break;
                case 4:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2+35*KWidth_Scale, 95*KHEIGHT_Scale, 35*KWidth_Scale, 35*KWidth_Scale*144/120.0);//真棒
                }
                    break;
                case 5:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2+100*KWidth_Scale, 160*KHEIGHT_Scale, 50*KWidth_Scale, 50*KWidth_Scale);//夜宿
                }
                    break;
                default:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*1+SCREEN_WIDTH/2+110*KWidth_Scale, 240*KHEIGHT_Scale, 40*KWidth_Scale, 40*KWidth_Scale*152/165.0);//寻宝
                }
                    break;
            }
            starImg.alpha=0;
          
            [_scrollView addSubview:starImg];
            [_page2PaopaoArr addObject:starImg];
        }
        
    }

    _guide_2_bgImg.alpha=0;
     [self animationPage2];
    
}
-(void)setUpPage_3{
    if (_guide_3_podiumImg==nil) {
        _guide_3_podiumImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2+40*KWidth_Scale, 90*KHEIGHT_Scale, SCREEN_WIDTH-40*KWidth_Scale*2, SCREEN_WIDTH-40*KWidth_Scale*2)];
        _guide_3_podiumImg.image = [UIImage imageNamed:@"Guide_3_Podium.png"];
        [_scrollView addSubview:_guide_3_podiumImg];
    }
    
    if (_guide_3_mascotImg==nil) {
        CGFloat mascotWidth=CGRectGetWidth(_guide_3_podiumImg.frame)*0.55;
        _guide_3_mascotImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-mascotWidth/2+SCREEN_WIDTH*2-15,CGRectGetMinY(_guide_3_podiumImg.frame)+20*KHEIGHT_Scale, mascotWidth, mascotWidth*557/458)];
        _guide_3_mascotImg.image = [UIImage imageNamed:@"Guide_3_Mascot.png"];
        [_scrollView addSubview:_guide_3_mascotImg];
    }
    if (_guide_3_Light_leftImg==nil) {
        CGFloat leftWeight=SCREEN_WIDTH-300*KWidth_Scale;
        
        _guide_3_Light_leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2+15, 100*KHEIGHT_Scale, leftWeight, leftWeight*463/320)];
        _guide_3_Light_leftImg.image = [UIImage imageNamed:@"Guide_3_Light_left.png"];
        [_scrollView addSubview:_guide_3_Light_leftImg];    }
    if (_guide_3_Light_rightImg==nil) {
        CGFloat rightWeight=SCREEN_WIDTH-280*KWidth_Scale;
        _guide_3_Light_rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*3-10-rightWeight*451/431, 100*KHEIGHT_Scale, rightWeight, rightWeight*451/431)];
        _guide_3_Light_rightImg.image = [UIImage imageNamed:@"Guide_3_Light_right.png"];
        [_scrollView addSubview:_guide_3_Light_rightImg];    }
    
    if(_page3StarArr==nil){
        _page3StarArr=[NSMutableArray array];
        for (int i=0; i<5; i++) {
            UIImageView *starImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Guide_3_Star.png"]];
            
            switch (i) {
                case 0:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*2+SCREEN_WIDTH/2+110*KWidth_Scale, 190*KHEIGHT_Scale, 8, 8);
                }
                    break;
                case 1:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*2+SCREEN_WIDTH/2+95*KWidth_Scale, 180*KHEIGHT_Scale, 12, 12);
                }
                    break;
                case 2:
                { starImg.frame=CGRectMake(SCREEN_WIDTH*2+SCREEN_WIDTH/2-115*KWidth_Scale, 210*KHEIGHT_Scale, 10, 10);
                    
                }
                    break;
                case 3:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*2+SCREEN_WIDTH/2+100*KWidth_Scale, 250*KHEIGHT_Scale, 15, 15);
                }
                    break;
                    
                default:
                {
                    starImg.frame=CGRectMake(SCREEN_WIDTH*2+SCREEN_WIDTH/2-110*KWidth_Scale, 230*KHEIGHT_Scale, 10, 10);
                }
                    break;
            }
            starImg.alpha=0;
            [_scrollView addSubview:starImg];
            [_page3StarArr addObject:starImg];
        }
       
    }
    _guide_3_mascotImg.alpha=0;
    _guide_3_podiumImg.alpha=0;
    _guide_3_Light_rightImg.layer.opacity=0;
    _guide_3_Light_leftImg.layer.opacity=0;

     [self animationPage3];
   
}
-(void)animationPage1{
   
   
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       
        _guide_1_earthImg.alpha=1;
       
    } completion:^(BOOL finished) {
    }];
    
    for (__weak UIImageView *imgView in _page1StarArr) {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            imgView.alpha=1;
            
        } completion:^(BOOL finished) {
        }];
        
    }
    //延时
    dispatch_time_t popTime1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC));
    dispatch_after(popTime1, dispatch_get_main_queue(), ^(void){
        for (__weak UIImageView *imgView in _page1StarArr) {
            [imgView beginAnimationWithType:WBadgeAnimTypeBreathe andAniDuration:arc4random()%10/10.0+1.0 delay:arc4random()%10/10.0];
        }
       
        
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _guide_1_mascotImg.alpha=1;
           
        } completion:^(BOOL finished) {
        }];
        
    });
    
    for (int i=0; i<_page1PaopaoArr.count; i++) {
        __weak UIImageView *imgView = _page1PaopaoArr[i];
      
            [imgView foldWithDuration:1 delayTime:i*0.2 withCompletionBlock:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [imgView beginAnimationWithType:WBadgeAnimTypeFloat andAniDuration:2 delay:1];
                        }
                        
                    }];
                }
            }];
            
        
    }

}
-(void)animationPage2{
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _guide_2_bgImg.alpha=1;
       
       
    } completion:^(BOOL finished) {
    }];
    
    for (int i=0; i<_page2PaopaoArr.count; i++) {
        __weak UIImageView *imgView = _page2PaopaoArr[i];
        if (i!=3&&i!=4) {
            [imgView foldWithDuration:1 delayTime:i*0.2 withCompletionBlock:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _guide_2_successImg.alpha=1;
                        UIImageView *imgView2=_page2PaopaoArr[3];
                        imgView2.alpha=1;
                        UIImageView *imgView1=_page2PaopaoArr[4];
                        imgView1.alpha=1;
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [imgView beginAnimationWithType:WBadgeAnimTypeFloat andAniDuration:2 delay:1];
                        }
                       
                    }];
                }
            }];
            
        }
    }
   
}
-(void)animationPage3{
   
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
       
        _guide_3_podiumImg.alpha=1;
        for (__weak UIImageView *imgView in _page3StarArr) {
            imgView.alpha=1;
        }
    } completion:^(BOOL finished) {
    }];
    
    //延时
    dispatch_time_t popTime1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
    dispatch_after(popTime1, dispatch_get_main_queue(), ^(void){
        
        for (__weak UIImageView *imgView in _page3StarArr) {
            [imgView beginAnimationWithType:WBadgeAnimTypeBreathe andAniDuration:arc4random()%10/10.0+1.0 delay:arc4random()%10/10.0];
        }
        
        [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _guide_3_mascotImg.alpha=1;
           
            
        } completion:^(BOOL finished) {
           
           
        }];
        [UIView animateWithDuration:1.8 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _guide_3_Light_rightImg.layer.opacity=1;
            _guide_3_Light_leftImg.layer.opacity=1;
            
            
        } completion:nil];
        
        
    });
    
    
    if(![_guide_3_Light_leftImg.layer animationForKey:@"left_rotation"] ){
        CGPoint oldAnchorPoint1 =  _guide_3_Light_leftImg.layer.anchorPoint;
        _guide_3_Light_leftImg.layer.anchorPoint = CGPointMake(0, 0);
        
        [_guide_3_Light_leftImg.layer setPosition:CGPointMake(_guide_3_Light_leftImg.layer.position.x + _guide_3_Light_leftImg.layer.bounds.size.width * (_guide_3_Light_leftImg.layer.anchorPoint.x - oldAnchorPoint1.x), _guide_3_Light_leftImg.layer.position.y + _guide_3_Light_leftImg.layer.bounds.size.height * (_guide_3_Light_leftImg.layer.anchorPoint.y - oldAnchorPoint1.y))];
        
        CAAnimationGroup *grup=[CAAnimationGroup animation];
        grup.animations=@[[CAAnimation rotation:4 degree:-0.3 *3.14 direction:WAxisZ repeatCount:1]];
        grup.repeatCount = MAXFLOAT;
        grup.duration = 4;
        grup.autoreverses = YES;
        [_guide_3_Light_leftImg.layer  addAnimation:grup
                                             forKey:@"left_rotation"];
    }
    
    if (![_guide_3_Light_rightImg.layer animationForKey:@"right_rotation"]) {
        CGPoint oldAnchorPoint =  _guide_3_Light_rightImg.layer.anchorPoint;
        _guide_3_Light_rightImg.layer.anchorPoint = CGPointMake(1, 0);
        [_guide_3_Light_rightImg.layer setPosition:CGPointMake(_guide_3_Light_rightImg.layer.position.x + _guide_3_Light_rightImg.layer.bounds.size.width * (_guide_3_Light_rightImg.layer.anchorPoint.x - oldAnchorPoint.x), _guide_3_Light_rightImg.layer.position.y + _guide_3_Light_rightImg.layer.bounds.size.height * (_guide_3_Light_rightImg.layer.anchorPoint.y - oldAnchorPoint.y))];
        
        CAAnimationGroup *grup1=[CAAnimationGroup animation];
        grup1.animations=@[[CAAnimation rotation:4 degree:0.25 *3.14 direction:WAxisZ repeatCount:1]];
        grup1.repeatCount = MAXFLOAT;
        grup1.duration = 4;
        grup1.autoreverses = YES;
        [_guide_3_Light_rightImg.layer addAnimation:grup1 forKey:@"right_rotation"];
    }

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = (scrollView.contentOffset.x+scrollView.frame.size.width/2)/scrollView.frame.size.width;
    _pagCtr.currentPage = index;
    
    _guide_1_mascotImg.alpha=0;
    _guide_1_earthImg.alpha=0;
    for (__weak UIImageView *imgView in _page1StarArr) {
        imgView.alpha=0;
      
    }
    
    _guide_2_bgImg.alpha=0;
    _guide_2_successImg.alpha=0;
    
    for (__weak UIImageView *imgView in _page2PaopaoArr) {
        imgView.alpha=0;
    }
    for (__weak UIImageView *imgView in _page1PaopaoArr) {
        imgView.alpha=0;
    }
    _guide_3_mascotImg.alpha=0;
    _guide_3_podiumImg.alpha=0;
    for (__weak UIImageView *imgView in _page3StarArr) {
        imgView.alpha=0;
    }
   
    _curPage = index;
    if (_curPage==0) {
        [self animationPage1];
    }
    else if (_curPage==1){
        [self setUpPage_2];
    }
    else
    {
        [self setUpPage_3];
    }

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}
-(void)addScrollView{
   _bgColorArr=@[RGBA(104, 204, 253, 1),RGBA(67, 209, 129, 1),RGBA(251, 139, 107, 1)];
   
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _bgColorArr.count, SCREEN_HEIGHT);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _pagCtr = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT - 40*KHEIGHT_Scale, 100, 10)];
    _pagCtr.numberOfPages = _bgColorArr.count;
    
    _pagCtr.currentPage = _curPage;
    [self.view addSubview:_pagCtr];
    
}
-(void)addBgImg{
    for (int i = 0; i<_bgColorArr.count; i++) {
        UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imgv.backgroundColor=_bgColorArr[i];
        //imgv.image = [UIImage imageNamed:_bgColorDic.allKeys[i]];
        [_scrollView addSubview:imgv];
        
        UIImageView *titleImgView=[[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-220*KWidth_Scale)/2+SCREEN_WIDTH*i, 490*KHEIGHT_Scale,220*KWidth_Scale, 220*KWidth_Scale*179/510.0)];
        [_scrollView addSubview:titleImgView];
        titleImgView.image=[UIImage imageNamed:[NSString stringWithFormat:@"Guide_%d_Title",i+1]];
        if (i==1) {
            titleImgView.frame=CGRectMake((SCREEN_WIDTH-220*KWidth_Scale)/2+SCREEN_WIDTH*i, 470*KHEIGHT_Scale,220*KWidth_Scale, 220*KWidth_Scale*173/503.0);
        }

        [_titleArr addObject:titleImgView];

        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [imgv addSubview:btn];
        imgv.userInteractionEnabled = YES;
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.showsTouchWhenHighlighted = NO;
        btn.frame = CGRectMake(SCREEN_WIDTH-70, 30, 45*KWidth_Scale, 25);
        [btn setTitle:@"跳过" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:16*KWidth_Scale]];
        [btn addTarget:self action:@selector(endGuide) forControlEvents:UIControlEventTouchUpInside];
        
        CALayer *btnBorder = [CALayer layer];
        btnBorder.frame = btn.bounds;
        btnBorder.borderWidth = 1;
        btnBorder.borderColor = [UIColor colorWithWhite:1.000 alpha:1].CGColor;
        btnBorder.cornerRadius =5;
        btnBorder.shouldRasterize = YES;
        btnBorder.rasterizationScale = [UIScreen mainScreen].scale;
        [btn.layer addSublayer:btnBorder];
        if (i==_bgColorArr.count-1) {
            CGFloat btnWidth=150*KWidth_Scale;
             btn.frame = CGRectMake((SCREEN_WIDTH-btnWidth)/2, SCREEN_HEIGHT - 120*KHEIGHT_Scale, btnWidth, 40*KWidth_Scale);
             btnBorder.frame = btn.bounds;
             btnBorder.borderWidth = 1.5;
              [btn.titleLabel setFont:[UIFont systemFontOfSize:17*KWidth_Scale]];
            [btn setTitle:@"立即进入" forState:UIControlStateNormal];
              btnBorder.cornerRadius =CGRectGetHeight(btn.frame) / 2;
            
            titleImgView.frame= CGRectMake((SCREEN_WIDTH-230*KWidth_Scale)/2+SCREEN_WIDTH*i, 420*KHEIGHT_Scale,230*KWidth_Scale, 230*KWidth_Scale*188/645.0);
          
        }
        
        
       
        
}
}
-(void)endGuide{
    NSLog(@"Skip");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
