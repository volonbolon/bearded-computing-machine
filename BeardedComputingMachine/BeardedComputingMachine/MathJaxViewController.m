//
//  MathJaxViewController.m
//  BeardedComputingMachine
//
//  Created by Ariel Rodriguez on 10/3/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "MathJaxViewController.h"
#import <WebKit/WebKit.h>

@interface MathJaxViewController () <UIWebViewDelegate>
@property (nonatomic, weak) WKWebView *webView;
@end

@implementation MathJaxViewController
- (void)viewDidLoad
{
    
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    WKWebView *wv = [[WKWebView alloc] initWithFrame:[[self view] bounds]
                                       configuration:configuration];
    
    [[self view] addSubview:wv];
    
    [self setWebView:wv];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html" inDirectory:@"MathJax/test"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[self webView] loadRequest:request];
    
}

@end
