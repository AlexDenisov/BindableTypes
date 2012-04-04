//
//  BindableNumberViewController.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BindableSliderViewController.h"

@interface BindableSliderViewController ()

@end

@implementation BindableSliderViewController
@synthesize sswitch;
@synthesize switchLabel;
@synthesize stepper;
@synthesize stepperLabel;
@synthesize slider;
@synthesize sliderLabel;
@synthesize switch;



- (void)dealloc {
    [slider release];
    [sliderLabel release];
    [switch release];
    [switchLabel release];
    [sswitch release];
    [stepper release];
    [stepperLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSlider:nil];
    [self setSliderLabel:nil];
    [self setSwitch:nil];
    [self setSwitchLabel:nil];
    [self setSswitch:nil];
    [self setStepper:nil];
    [self setStepperLabel:nil];
    [super viewDidUnload];
}
@end