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
        self.view.backgroundColor = [UIColor colorWithRed:0.921f green:0.929f blue:1.000f alpha:1.000f];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((UIViewController *)segue.destinationViewController).hidesBottomBarWhenPushed = YES;
}

@end
