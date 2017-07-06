//
//  ViewController.m
//  UI基础-小飞机(纯代码)
//
//  Created by libbbb on 2017/7/5.
//  Copyright © 2017年 libbbb. All rights reserved.
//

#import "ViewController.h"
//使用枚举区分按钮的tag
typedef enum : NSUInteger {
    DisHerotop = 1,
    DisHerobottom = 2,
    DisHeroleft = 3,
    DisHeroright = 4,
} DisHero;

@interface ViewController ()
@property (nonatomic, weak) UIButton *hero;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - 设置UI
- (void)setupUI {
    //1.设置背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"background"];
    //背景图片大小位置
    imageView.frame = self.view.frame;
    //添加到视图
    [self.view addSubview:imageView];
    
    //2.设置小飞机
    UIButton *hero = [[UIButton alloc] init];
    [hero setImage:[UIImage imageNamed:@"hero1"] forState:UIControlStateNormal];
    [hero setImage:[UIImage imageNamed:@"hero2"] forState:UIControlStateHighlighted];
    [hero sizeToFit];
    hero.center = self.view.center;
    [self.view addSubview:hero];
    self.hero = hero;
    
    //3.设置4个方向按钮
    [self disButtonWithOffsetX:0 andOffsetY:-40 andDir:@"top" andTag:DisHerotop];
    [self disButtonWithOffsetX:0 andOffsetY:40 andDir:@"bottom" andTag:DisHerobottom];
    [self disButtonWithOffsetX:-40 andOffsetY:0 andDir:@"left" andTag:DisHeroleft];
    [self disButtonWithOffsetX:40 andOffsetY:0 andDir:@"right" andTag:DisHeroright];
}
#pragma mark - 方向按钮方法
- (void)disButtonWithOffsetX:(CGFloat)offsetX andOffsetY:(CGFloat)offsetY andDir:(NSString *)dir andTag:(NSInteger)tag {
    //获取中间红色View的位置
    CGRect rect = CGRectMake(self.view.center.x - 20, 500, 40, 40);
    //创建按钮,设置图片
    UIButton *disBtn = [[UIButton alloc] init];
    [disBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",dir]] forState:UIControlStateNormal];
    [disBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",dir]] forState:UIControlStateHighlighted];
    //设置图片大小位置
    disBtn.frame = CGRectOffset(rect, offsetX, offsetY);
    //添加到视图
    [self.view addSubview:disBtn];
    self.hero.tag = tag;
    
    //添加按钮监听事件
    [disBtn addTarget:self action:@selector(moveHero:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 按钮监听事件
- (void)moveHero:(UIButton *)sender {
    CGRect rect = self.hero.frame;
    //实现按钮移动
    switch (sender.tag) {
        case DisHerotop:
            rect.origin.y -= 10;
            break;
        case DisHerobottom:
            rect.origin.y += 10;
            break;
        case DisHeroleft:
            rect.origin.x -= 10;
            break;
        case DisHeroright:
            rect.origin.x += 10;
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
