//
//  MathJaxViewController.m
//  BeardedComputingMachine
//
//  Created by Ariel Rodriguez on 10/3/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "MathJaxViewController.h"
#import <WebKit/WebKit.h>

@interface MathJaxViewController () <UIWebViewDelegate, WKScriptMessageHandler>
@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, strong) UIWindow *window;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MathJaxViewController
- (void)viewDidLoad
{
    
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    [self addUserScriptToUserController:[configuration userContentController]];
    WKWebView *wv = [[WKWebView alloc] initWithFrame:[[self view] bounds]
                                       configuration:configuration];
    
    UIWindow *w = [[UIWindow alloc] initWithFrame:[[self view] bounds]];
    
    [w addSubview:wv];
    
    [self setWindow:w];
    
    [self setWebView:wv];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html" inDirectory:@"MathJax/test"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[self webView] loadRequest:request];
    
}

- (void)addUserScriptToUserController:(WKUserContentController *)userContentController
{
    
    WKUserScript *script = [[WKUserScript alloc] initWithSource:@"var f = function(){ var width = document.getElementById('wrapper').offsetWidth; var height = document.getElementById('wrapper').offsetHeight; window.webkit.messageHandlers.doneWithMathJax.postMessage([width, height]); }; MathJax.Hub.Queue(f);" injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];

    [userContentController addUserScript:script];
    
    [userContentController addScriptMessageHandler:self
                                              name:@"doneWithMathJax"];
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
    [self performSelector:@selector(captureScreenshot:) withObject:message afterDelay:.1f];
    
}

- (void)captureScreenshot:(WKScriptMessage *)message
{
    
    WKWebView *webView = [self webView];

    NSArray *body = [message body];
    
    CGFloat width = [[body firstObject] floatValue]/2.0f;
    CGFloat height = [[body lastObject] floatValue];
    
    CGRect frame = CGRectMake(0.0f, 0.0f, width, height);
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [[webView layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    [[self imageView] setImage:img];
    
}

@end
