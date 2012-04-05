//
//  BTSwitchNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTSwitchNumber.h"

@implementation BTSwitchNumber

@synthesize boundedSwitch;

- (void)bindSwitch:(UISwitch *)aSwitch {
    self.boundedSwitch = aSwitch;
    if(self.boundedNumber){
        [self.boundedSwitch setOn:self.boundedNumber.boolValue];
    }else{
        self.boundedNumber = [NSNumber numberWithBool:self.boundedSwitch.isOn];
    }
    [self.boundedSwitch addTarget:self
                           action:@selector(valueDidChanged:)
                 forControlEvents:UIControlEventValueChanged];
}

- (void)valueDidChanged:(id)aSender {
    UISwitch *aSwitch = (UISwitch *)aSender;
    self.boundedNumber = [NSNumber numberWithBool:aSwitch.isOn];
}

- (NSString *)labelText {
    return [NSString stringWithFormat:@"%d", self.boundedNumber.boolValue];
}

@end
