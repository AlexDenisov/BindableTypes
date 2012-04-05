//
//  BTStepperNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTStepperNumber.h"

@implementation BTStepperNumber

@synthesize boundedStepper;

- (void)bindStepper:(UIStepper *)aStepper {
    self.boundedStepper = aStepper;
    [self.boundedStepper addTarget:self
                            action:@selector(valueDidChanged:)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)valueDidChanged:(id)aSender {
    UIStepper *stepper = (UIStepper *)aSender;
    self.boundedNumber = [NSNumber numberWithDouble:stepper.value];
}

- (NSString *)labelText {
    NSNumber *number = self.boundedNumber;
    if(number == nil){
        number = [NSNumber numberWithDouble:self.boundedStepper.value];
    }
    return [NSString stringWithFormat:@"%@", number];
}

@end
