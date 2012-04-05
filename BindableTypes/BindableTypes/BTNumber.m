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

#pragma mark - UISlider

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider {
    return [self numberWithSlider:aSlider
                       withNumber:nil
                     withDelegate:nil];
}

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider 
                    withNumber:(NSNumber *)aNumber
{
    return [self numberWithSlider:aSlider
                       withNumber:aNumber
                     withDelegate:nil];
}

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider 
                    withNumber:(NSNumber *)aNumber 
                  withDelegate:(id<BTValueProtocol>)aDelegate
{
    BTSliderNumber *number = [[[BTSliderNumber alloc] initWithNumber:aNumber] autorelease];
    [number bindSlider:aSlider];
    [number setDelegate:aDelegate];
    return number;
}

#pragma mark - UIStepper

+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper {
    return [self numberWithStepper:aStepper
                        withNumber:nil
                      withDelegate:nil];
}

+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper 
                     withNumber:(NSNumber *)aNumber
{
    return [self numberWithStepper:aStepper
                        withNumber:aNumber
                      withDelegate:nil];
}

+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper 
                     withNumber:(NSNumber *)aNumber 
                   withDelegate:(id<BTValueProtocol>)aDelegate
{
    BTStepperNumber *number = [[[BTStepperNumber alloc] initWithNumber:aNumber] autorelease];
    [number bindStepper:aStepper];
    [number setDelegate:aDelegate];
    return number;
}

#pragma mark - UISwitch

+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch {
    return [self numberWithSwitch:aSwitch
                       withNumber:nil
                     withDelegate:nil];
}

+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch 
                    withNumber:(NSNumber *)aNumber
{
    return [self numberWithSwitch:aSwitch
                       withNumber:aNumber
                     withDelegate:nil];
}

+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch 
                    withNumber:(NSNumber *)aNumber 
                  withDelegate:(id<BTValueProtocol>)aDelegate
{
    BTSwitchNumber *number = [[[BTSwitchNumber alloc] initWithNumber:aNumber] autorelease];
    [number bindSwitch:aSwitch];
    [number setDelegate:aDelegate];
    return number;
}

#pragma mark - 

- (void)bindLabel:(UILabel *)aLabel {}
- (NSNumber *)numberValue {return nil;}

@end
