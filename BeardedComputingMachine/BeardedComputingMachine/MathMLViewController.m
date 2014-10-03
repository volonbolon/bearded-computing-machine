//
//  ViewController.m
//  BeardedComputingMachine
//
//  Created by Ariel Rodriguez on 9/23/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "MathMLViewController.h"

@interface MathMLViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MathMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        NSString *payload = @"<p>The most beautiful equation: <math xmlns=\"http://www.w3.org/1998/Math/MathML\" title=\"Euler's Identity\"><msup><mi>e</mi><mrow><mi>i</mi><mi>&pi;</mi></mrow></msup><mo>+</mo><mn>1</mn><mo>=</mo><mn>0</mn></math></p><div><p>And something more complex (and yet beautiful, Dirac Equation)</p><math xmlns=\"http://www.w3.org/1998/Math/MathML\" overflow=\"scroll\"> <mo>&#x2212;</mo> <mi>i</mi> <msub> <mo>&#x2202;</mo> <mi>t</mi> </msub> <mi>&#x3C8;</mi> <mo>=</mo> <mi>i</mi> <mi>c</mi> <mi>&#x210F;</mi> <munderover> <mo>&#x2211;</mo> <mrow> <mi>k</mi> <mo>=</mo> <mn>1</mn> </mrow> <mn>3</mn> </munderover> <msub> <mi>&#x3B1;</mi> <mi>k</mi> </msub> <msub> <mo>&#x2202;</mo> <mi>k</mi> </msub> <mi>&#x3C8;</mi> <mo>&#x2212;</mo> <mi>m</mi> <msup> <mi>c</mi> <mn>2</mn> </msup> <mi>&#x3B2;</mi> <mi>&#x3C8;</mi> <mo>+</mo> <msub> <mi mathvariant=\"normal\">&#x2207;</mi> <mi>&#x3C8;</mi> </msub> <mi>G</mi> <mo stretchy=\"false\">(</mo> <mi>x</mi> <mo>,</mo> <mi>&psi;</mi> <mo stretchy=\"false\">)</mo></math></div>";
    
    [[self webView] loadHTMLString:payload
                           baseURL:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
