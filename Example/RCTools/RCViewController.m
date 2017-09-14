//
//  RCViewController.m
//  RCTools
//
//  Created by CoderTWWu on 05/17/2017.
//  Copyright (c) 2017 CoderTWWu. All rights reserved.
//

#import "RCViewController.h"
#import "RCTools.h"

@interface RCViewController ()

@end

@implementation RCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *testView = [UIView instance];
    testView.backgroundColor = [UIColor redColor];
    
    testView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:testView];
    
    
    NSLog(@"%@  == %@  == %@",[testView getCurrentNavController],[testView getCurrentViewController],[testView getCurrentVC]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
