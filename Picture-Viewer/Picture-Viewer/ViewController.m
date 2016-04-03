//
//  ViewController.m
//  Picture-Viewer
//
//  Created by  江苏 on 16/4/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel* topLabel;
@property(nonatomic,strong)UIImageView* imageView;
@property(nonatomic,strong)UIButton* leftButton;
@property(nonatomic,strong)UIButton* rightButton;
@property(nonatomic,strong)UILabel* detailLabel;
@property(nonatomic)int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建顶部标签
    self.topLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 20)];
    self.topLabel.text=@"1/5";
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.topLabel];
    //创建图片
    CGFloat imageViewW=200;
    CGFloat imageViewH=200;
    CGFloat imageViewX=(self.view.bounds.size.width-imageViewW)*0.5;
    CGFloat imageViewY=CGRectGetMaxY(_topLabel.frame);
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
    UIImage* image=[UIImage imageNamed:@"biaoqingdi"];
    self.imageView.image=image;
    [self.view addSubview:self.imageView];
    //创建底部描述性文字
    self.detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.view.bounds.size.width, 20)];
    self.detailLabel.text=@"表情帝";
    self.detailLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.detailLabel];
    //创建左边按钮
    self.leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    CGFloat centerY=self.imageView.center.y;
    CGFloat centerX=self.imageView.frame.origin.x*0.5;
    self.leftButton.center=CGPointMake(centerX, centerY);
    [self.leftButton setImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [self.leftButton setImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [self.leftButton addTarget:self action:@selector(prePhoto) forControlEvents:UIControlEventTouchUpInside];
    self.leftButton.enabled=NO;
    [self.view addSubview:self.leftButton];
    //创建右边按钮
    self.rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.rightButton.center=CGPointMake((CGRectGetMaxX(self.imageView.frame)+self.view.bounds.size.width)/2, centerY);
    [self.rightButton setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.rightButton addTarget:self action:@selector(nextPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rightButton];
}
-(void)prePhoto{
    self.rightButton.enabled=YES;
    self.index--;
    [self choosePhoto];
    if(self.index==0){
        self.leftButton.enabled=NO;
    }else{
        self.leftButton.enabled=YES;
    }
}
-(void)nextPhoto{
    self.leftButton.enabled=YES;
    self.index++;
    [self choosePhoto];
    if (self.index==4) {
        self.rightButton.enabled=NO;
    }else{
        self.rightButton.enabled=YES;
    }
}
-(void)choosePhoto{
    self.topLabel.text=[NSString stringWithFormat:@"%d/%d",self.index+1,5];
    switch (self.index) {
        case 0:
            self.imageView.image=[UIImage imageNamed:@"biaoqingdi"];
            self.detailLabel.text=@"表情帝";
            break;
        case 1:
            self.imageView.image=[UIImage imageNamed:@"bingli"];
            self.detailLabel.text=@"病历";
            break;
        case 2:
            self.imageView.image=[UIImage imageNamed:@"chiniupa"];
            self.detailLabel.text=@"吃牛扒";
            break;
        case 3:
            self.imageView.image=[UIImage imageNamed:@"danteng"];
            self.detailLabel.text=@"蛋疼";
            break;
        case 4:
            self.imageView.image=[UIImage imageNamed:@"wangba"];
            self.detailLabel.text=@"王八";
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
