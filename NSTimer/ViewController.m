//
//  ViewController.m
//  NSTimer
//
//  Created by Tech-zhangyangyang on 2017/4/26.
//  Copyright © 2017年 Tech-zhangyangyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL isStart;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isStart = NO;
    _count   = 1;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.label.backgroundColor = [UIColor grayColor];
    self.label.text = @"点击开始倒计时按钮";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(0,300, self.view.frame.size.width, self.view.frame.size.height - 300);
    [self.btn setTitle:@"开始" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor yellowColor];
    [self.btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)clicked:(UIButton *)sender {
    _isStart = !_isStart;
    if (_isStart) {
        //开启
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        [self.timer setFireDate:[NSDate distantPast]];
        [self.btn setTitle:@"暂停" forState:UIControlStateNormal];
    
    }else {
        [self.timer setFireDate:[NSDate distantFuture]];
        [self.btn setTitle:@"继续" forState:UIControlStateNormal];
    }
}

- (void)timerAction {
    _count ++;
    self.label.text = [NSString stringWithFormat:@"%ld",_count];
}

- (void)dealloc {
    if (self.timer.isValid) {
        [self.timer invalidate];
    }
    self.timer = nil;
}

@end
