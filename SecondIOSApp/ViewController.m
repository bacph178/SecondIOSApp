//
//  ViewController.m
//  SecondIOSApp
//
//  Created by BacPH on 2014/09/16.
//  Copyright (c) 2014年 Phung.Hoang.Bac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIActivityViewController *activityViewController;

@end

@implementation ViewController

- (void)createTextField {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f,
                                                                   35.0f,
                                                                   280.0f,
                                                                   30.0f)];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter text to share...";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (void)createButton {
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonShare.frame = CGRectMake(20.0f, 80.0f, 280.0f, 44.0f);
    [self.buttonShare setTitle:@"Share" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self
                         action:@selector(handleShare:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (void)handleShare:(id)paramSender {
    if ([self.textField.text length] == 0) {
        NSString *message = @"Please enter a text and then press Share";
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:nil
                                                           message:message
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alerView show];
        return;
    }
    self.activityViewController = [[UIActivityViewController alloc]
                                   initWithActivityItems:@[self.textField.text]
                                   applicationActivities:nil];
    [self presentViewController:self.activityViewController
                       animated:YES completion:^{}];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTextField];
    [self createButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
