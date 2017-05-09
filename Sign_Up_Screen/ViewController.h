//
//  ViewController.h
//  Sign_Up_Screen
//
//  Created by Apple on 15/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtFldFirstName;

@property (weak, nonatomic) IBOutlet UITextField *txtFldLastName;

@property (weak, nonatomic) IBOutlet UITextField *txtFldPhoneNo;
@property (weak, nonatomic) IBOutlet UITextField *txtFldCity;


@property (weak, nonatomic) IBOutlet UITextField *txtFldState;

@property (weak, nonatomic) IBOutlet UITextField *txtFldZipCode;


@property (weak, nonatomic) IBOutlet UITextField *txtFldCountry;

@property (weak, nonatomic) IBOutlet UITextField *currentTextField;


@property (weak, nonatomic) IBOutlet UIScrollView *ScrlViewSignUpVC;



@end

