//
//  BindableTextFieldViewController.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BindableTextFieldViewController.h"
#import "BTString.h"

@interface BindableTextFieldViewController ()

@end

@implementation BindableTextFieldViewController

@synthesize firstNameTextField;
@synthesize firstName;

@synthesize lastNameTextField;
@synthesize lastName;

@synthesize nickNameTextField;
@synthesize firstNameLabel;
@synthesize lastNameLabel;
@synthesize nickNameLabel;
@synthesize nickName;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstName = [BTString stringWithTextField:self.firstNameTextField];
    [self.firstName bindLabel:self.firstNameLabel];
    
    self.lastName = [BTString stringWithTextField:self.lastNameTextField];
    [self.lastName bindLabel:self.lastNameLabel];
    
    self.nickName = [BTString stringWithTextField:self.nickNameTextField];
    [self.nickName bindLabel:self.nickNameLabel];
    
}

- (void)dealloc {
    [firstNameTextField release];
    [lastNameTextField release];
    [nickNameTextField release];
    [firstNameLabel release];
    [lastNameLabel release];
    [nickNameLabel release];
    self.firstName = nil;
    self.lastName = nil;
    self.nickName = nil;
    
    [super dealloc];
}

- (void)viewDidUnload {
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [self setNickNameTextField:nil];
    [self setFirstNameLabel:nil];
    [self setLastNameLabel:nil];
    [self setNickNameLabel:nil];
    [super viewDidUnload];
}

@end
