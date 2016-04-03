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
    [self.view addSubview:self.leftButton];
    //创建右边按钮
    self.rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.rightButton.center=CGPointMake((CGRectGetMaxX(self.imageView.frame)+self.view.bounds.size.width)/2, centerY);
    [self.rightButton setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:self.rightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
