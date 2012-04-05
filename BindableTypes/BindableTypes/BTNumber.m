//
//  BTNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTNumber.h"
#import "BTSliderNumber.h"
#import "BTStepperNumber.h"
#import "BTSwitchNumber.h"

@implementation BTNumber

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider {
    BTSliderNumber *number = [[[BTSliderNumber alloc] init] autorelease];
    [number bindWithSlider:aSlider];
    return number;
}

+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper {
    BTStepperNumber *number = [[BTStepperNumber alloc] init];
    [number bindStepper:aStepper];
    return number;
}

+ (BTNumber *)numberwithSwitch:(UISwitch *)aSwitch {
    BTSwitchNumber *number = [[[BTSwitchNumber alloc] init] autorelease];
    [number bindSwitch:aSwitch];
    return number;
}

- (void)bindLabel:(UILabel *)aLabel {}
- (NSNumber *)numberValue {return nil;}

@end
