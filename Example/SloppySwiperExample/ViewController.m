//
//  ViewController.m
//  SloppySwiperExample
//
//  Created by Arkadiusz on 29-05-14.
//  Copyright (c) 2014 Arkadiusz Holko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSUInteger stackCount = [self.navigationController.viewControllers count];

    if (stackCount % 2 == 0) {
        self.view.backgroundColor = [UIColor colorWithRed:0.921 green:0.929 blue:1.000 alpha:1.000];
    }

    self.title = [@(stackCount) stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
