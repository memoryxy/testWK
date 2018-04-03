//
//  YXWKWebView.m
//  testWK
//
//  Created by wangjianfei on 2018/4/3.
//  Copyright © 2018年 wangjianfei. All rights reserved.
//

#import "YXWKWebView.h"

@implementation YXWKWebView

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler {
    id strongSelf = self;
    [super evaluateJavaScript:javaScriptString completionHandler:^(id r, NSError *e) {
        [strongSelf title];
        if (completionHandler) {
            completionHandler(r, e);
        }
    }];
}

@end
