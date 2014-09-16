//
//  ViewController.m
//  SecondIOSApp
//
//  Created by BacPH on 2014/09/16.
//  Copyright (c) 2014年 Phung.Hoang.Bac. All rights reserved.
//

#import "ViewController.h"
#import "StringReverserActivity.h"
@implementation ViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSArray *itemsToShare = @[@"Item 1", @"Item 2", @"Item 3"];
    UIActivityViewController *activity = [[UIActivityViewController alloc]
                                          initWithActivityItems:itemsToShare
                                          applicationActivities:@[[StringReverserActivity new]]];
    [self presentViewController:activity animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
