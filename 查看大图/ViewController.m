//
//  ViewController.m
//  查看大图
//
//  Created by G.Z on 16/5/1.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = [UIImage imageNamed:@"1.jpg"];
    //边距设置
    self.scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //不显示水平滚动标示
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //不显示垂直滚动标示
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    //偏移位置
    self.scrollView.contentOffset = CGPointMake(0,-100);
    //取消弹簧效果,固定内容
    //不要跟bounds属性搞混了
    self.scrollView.bounces = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

}

- (void)setImage:(UIImage *)image
{
    _image = image;
    //设置图像视图的内容
    self.imageView.image = image;
    [self.imageView sizeToFit];
    //设置scrollview内部内容实际大小
    self.scrollView.contentSize = image.size;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        
        _imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
    
}
- (void)click
{
    // 移动大图的偏移位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 20;
    offset.y += 20;
    
    // 注意：设置contentOffset会忽略contentSize
    self.scrollView.contentOffset = offset;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
