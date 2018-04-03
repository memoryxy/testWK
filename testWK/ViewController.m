//
//  ViewController.m
//  testWK
//
//  Created by wangjianfei on 2018/4/3.
//  Copyright © 2018年 wangjianfei. All rights reserved.
//

#import "ViewController.h"
#import "YXWeb.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (nonatomic, strong) YXWeb *web;
@property (nonatomic, strong) WKWebView *wk;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.wk = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.wk];
        [self.wk loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.you.163.com/act/pub/Qz0MQJEnQb.html"]]];
    });
    
    self.web = [YXWeb new];
    [self.view addSubview:self.web.view];
    [self addChildViewController:self.web];
    
    self.web = nil;
}

@end
