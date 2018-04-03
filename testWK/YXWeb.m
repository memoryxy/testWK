//
//  YXWeb.m
//  testWK
//
//  Created by wangjianfei on 2018/4/3.
//  Copyright © 2018年 wangjianfei. All rights reserved.
//

#import "YXWeb.h"
#import <WebKit/WebKit.h>
#import "YXWKWebView.h"

@interface YXWeb ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wk;

@end

@implementation YXWeb

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wk = [[YXWKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.wk];
    [self.wk loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.you.163.com/activity/popWindow?id=9164567&type=2&popWindowExtInfo=&newDevice="]]];
    self.wk.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    __weak YXWeb *temp = self;
    [self.wk evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@", temp);
    }];
    NSLog(@"finished");
    [temp.view removeFromSuperview];
    [temp removeFromParentViewController];
}

- (void) dealloc {
    NSLog(@"dealloc");
}

@end
