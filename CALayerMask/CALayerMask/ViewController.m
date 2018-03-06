//
//  ViewController.m
//  CALayerMask
//
//  Created by 龙悦 on 16/6/1.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
}

-(void)addView{
    //注意Z轴位置
    UIImageView *titleBack = [[UIImageView alloc]init];
    titleBack.image = [UIImage imageNamed:@"titleBack.png"];
    titleBack.frame = CGRectMake(0, 100, SCREEN_SIZE.width, 150);
    [self.view addSubview:titleBack];
    
    
    UIImageView *title = [[UIImageView alloc]init];
    title.image = [UIImage imageNamed:@"title.png"];
    title.frame = CGRectMake(0, 100, SCREEN_SIZE.width, 150);
    [self.view addSubview:title];
    
    //遮罩剪切
    title.layer.mask = [self titleMaskLayer:title];
    
}

-(CALayer*)titleMaskLayer:(UIImageView*)imageView{
    
    CALayer *mask = [CALayer layer];
    UIImage *maskImage = [UIImage imageNamed:@"spark.png"];
    mask.contents = (__bridge id _Nullable)(maskImage.CGImage);
    mask.frame = CGRectMake(100.0f, 0, 50.0f, imageView.bounds.size.height);
    mask.bounds = CGRectMake(0, 0, 50.0f, imageView.bounds.size.height);
    
    
    //添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-50.0f, imageView.bounds.size.height/2.0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(imageView.bounds.size.width, imageView.bounds.size.height/2.0)];
    animation.duration = 3.0f;
    animation.repeatCount = HUGE_VALF;
    [mask addAnimation:animation forKey:@"animation"];
    
    return mask;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
