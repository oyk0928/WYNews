//
//  NewsDetailViewController.m
//  WYNews
//
//  Created by 姚乐 on 16/10/23.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NetworkTool.h"
#import "NewsDetailModel.h"
#import "NewsDetailImgModel.h"

@interface NewsDetailViewController()<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)NewsDetailModel* newsDetailModel;
@property (nonatomic,assign)CGFloat webHeight;




@end
@implementation NewsDetailViewController

-(void)viewDidLoad {
    NSString* url= [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",self.model.docid];
    //@"http://c.m.163.com/nc/article/C427KLOS00238087/full.html";
    YaoLog(@"%@",url);
    [[NetworkTool sharedTool] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {
        NSString* key = [responseObject.keyEnumerator nextObject];
        self.newsDetailModel = [NewsDetailModel newsDetailModelWithDict:responseObject[key]];
        YaoLog(@"%@",self.newsDetailModel);
        [self.webView loadHTMLString:[self getHtmlString] baseURL:nil];
        [self.view addSubview:self.webView];
        [self.webView setFrame:self.view.frame];
        self.webView.y = 64;
        [self.navigationController setToolbarHidden:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}






-(UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];//WithFrame:CGRectMake(0, 0, 375, 600)
    }
    return _webView;
}

- (NSString *)getHtmlString
{
    NSMutableString *html = [NSMutableString string];
    [html appendString:@"<html>"];
    [html appendString:@"<head>"];
    [html appendFormat:@"<link rel=\"stylesheet\" href=\"%@\">",[[NSBundle mainBundle] URLForResource:@"SXDetails.css" withExtension:nil]];
    [html appendString:@"</head>"];
    
    [html appendString:@"<body style=\"background:#f6f6f6\">"];
    [html appendString:[self getBodyString]];
    [html appendString:@"</body>"];
    
    [html appendString:@"</html>"];
    
    return html;
}

- (NSString *)getBodyString
{
    NSMutableString *body = [NSMutableString string];
    [body appendFormat:@"<div class=\"title\">%@</div>",self.newsDetailModel.title];
    [body appendFormat:@"<div class=\"time\">%@</div>",self.newsDetailModel.ptime];
    if (self.newsDetailModel.body != nil) {
        [body appendString:self.newsDetailModel.body];
    }
    for (NewsDetailImgModel *detailImgModel in self.newsDetailModel.img) {
        NSMutableString *imgHtml = [NSMutableString string];
        // 设置img的div
        [imgHtml appendString:@"<div class=\"img-parent\">"];
        NSArray *pixel = [detailImgModel.pixel componentsSeparatedByString:@"*"];
        CGFloat width = [[pixel firstObject]floatValue];
        CGFloat height = [[pixel lastObject]floatValue];
        // 判断是否超过最大宽度
        CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width * 0.96;
        if (width > maxWidth) {
            height = maxWidth / width * height;
            width = maxWidth;
        }
        
        NSString *onload = @"this.onclick = function() {"
        "  window.location.href = 'sx://github.com/dsxNiubility?src=' +this.src+'&top=' + this.getBoundingClientRect().top + '&whscale=' + this.clientWidth/this.clientHeight ;"
        "};";
        [imgHtml appendFormat:@"<img onload=\"%@\" width=\"%f\" height=\"%f\" src=\"%@\">",onload,width,height,detailImgModel.src];
        [imgHtml appendString:@"</div>"];
        [body replaceOccurrencesOfString:detailImgModel.ref withString:imgHtml options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    }
    return body;
}


@end
