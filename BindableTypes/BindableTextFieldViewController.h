//
//  BindableTextFieldViewController.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BTString;

@interface BindableTextFieldViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (retain, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *nickNameLabel;

@property (nonatomic, retain) BTString *firstName;
@property (nonatomic, retain) BTString *lastName;
@property (nonatomic, retain) BTString *nickName;

@end
