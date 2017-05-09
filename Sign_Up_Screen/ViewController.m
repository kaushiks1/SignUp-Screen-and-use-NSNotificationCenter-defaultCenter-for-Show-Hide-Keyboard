//
//  ViewController.m
//  Sign_Up_Screen
//
//  Created by Apple on 15/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *aGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    aGest.numberOfTapsRequired = 1;
    [self.ScrlViewSignUpVC addGestureRecognizer:aGest];

    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


#pragma mark - Gester method
- (void)tapDetected {
    [self.currentTextField resignFirstResponder];
}



#pragma mark - UIKeyboard show/hide notification
- (void)keyboardWillShow:(NSNotification *)iNotification {
    
    NSLog(@"%f", [iNotification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);
    NSDictionary *aKeyInfo = iNotification.userInfo;
    NSValue *aRectValue = [aKeyInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect aRect = [aRectValue CGRectValue];
    if (self.currentTextField.tag == 5 || self.currentTextField.tag == 6 || self.currentTextField.tag == 7) {
        self.ScrlViewSignUpVC.contentOffset = CGPointMake(0, (aRect.size.height) - 50);
    }
}

- (void)keyboardWillHide:(NSNotification *)iNotification  {
    self.ScrlViewSignUpVC.contentOffset = CGPointMake(0, 0);
}


#pragma mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentTextField = textField;
}



@end
