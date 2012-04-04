//
//  BindableNumberViewController.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BindableSliderViewController : UIViewController

@property (retain, nonatomic) IBOutlet UISlider *slider;
@property (retain, nonatomic) IBOutlet UILabel *sliderLabel;
@property (retain, nonatomic) IBOutlet UISwitch *sswitch;
@property (retain, nonatomic) IBOutlet UILabel *switchLabel;
@property (retain, nonatomic) IBOutlet UIStepper *stepper;
@property (retain, nonatomic) IBOutlet UILabel *stepperLabel;
@end