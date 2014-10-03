//
//  MathJaxViewController.m
//  BeardedComputingMachine
//
//  Created by Ariel Rodriguez on 10/3/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "MathJaxViewController.h"

@interface MathJaxViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MathJaxViewController
- (void)viewDidLoad
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[self webView] loadRequest:request];
    
}
@end
