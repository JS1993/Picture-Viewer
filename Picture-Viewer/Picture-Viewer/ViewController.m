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
@property(nonatomic,strong)NSArray* array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置顶部标签
    self.topLabel.text=@"1/5";
    //设置图片
    UIImage* image=[UIImage imageNamed:@"biaoqingdi"];
    self.imageView.image=image;
    //设置底部描述性文字
    self.detailLabel.text=@"表情帝";
    //设置左边按钮
    [self.leftButton addTarget:self action:@selector(prePhoto) forControlEvents:UIControlEventTouchUpInside];
    //设置右边按钮
    [self.rightButton addTarget:self action:@selector(nextPhoto) forControlEvents:UIControlEventTouchUpInside];
}
//数组数据的懒加载
-(NSArray*)array{
    if (_array==nil) {
        _array=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"imageList" ofType:@"plist"]];
    }
    return _array;
}
//顶部标签的懒加载
-(UILabel*)topLabel{
    if(_topLabel==nil){
        _topLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 20)];
        _topLabel.textAlignment=NSTextAlignmentCenter;
       _topLabel.text=@"1/5";
        [self.view addSubview:_topLabel];
    }
    return _topLabel;
}
//图片的懒加载
-(UIImageView*)imageView{
    if (_imageView==nil) {
        CGFloat imageViewW=200;
        CGFloat imageViewH=200;
        CGFloat imageViewX=(self.view.bounds.size.width-imageViewW)*0.5;
        CGFloat imageViewY=CGRectGetMaxY(_topLabel.frame);
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
        UIImage* image=[UIImage imageNamed:@"biaoqingdi"];
        _imageView.image=image;
        [self.view addSubview:_imageView];
    }
    return _imageView;
}
//底部描述性文字的懒加载
-(UILabel*)detailLabel{
    if (_detailLabel==nil) {
        _detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.view.bounds.size.width, 20)];
        _detailLabel.text=@"表情帝";
        _detailLabel.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:_detailLabel];
    }
    return _detailLabel;
}
//左边按钮的懒加载
-(UIButton *)leftButton{
    if (_leftButton==nil) {
        _leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat centerY=self.imageView.center.y;
        CGFloat centerX=self.imageView.frame.origin.x*0.5;
        _leftButton.center=CGPointMake(centerX, centerY);
        _leftButton.enabled=NO;
        [_leftButton setImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
        [_leftButton addTarget:self action:@selector(prePhoto) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftButton];
    }
    return _leftButton;
}
//右边按钮的懒加载
-(UIButton *)rightButton{
    if (_rightButton==nil) {
       CGFloat centerY=self.imageView.center.y;
        _rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _rightButton.center=CGPointMake((CGRectGetMaxX(self.imageView.frame)+self.view.bounds.size.width)/2, centerY);
        [_rightButton setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        [_rightButton addTarget:self action:@selector(nextPhoto) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightButton];
    }
    return _rightButton;
}
-(void)prePhoto{
    self.index--;
    [self choosePhoto];
    [self estimate];
}
-(void)nextPhoto{
    self.index++;
    [self choosePhoto];
    [self estimate];
}
-(void)estimate{
    self.rightButton.enabled=(self.index!=4);
    self.leftButton.enabled=(self.index!=0);
}
-(void)choosePhoto{
    self.imageView.image=[UIImage imageNamed:self.array[self.index][@"name"]];
    self.detailLabel.text=self.array[self.index][@"desc"];
    self.topLabel.text=[NSString stringWithFormat:@"%d/%d",self.index+1,5];
}

@end
