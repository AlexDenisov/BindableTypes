//
//  BTStepperNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTStepperNumber.h"

@interface BTStepperNumber ()

@property (nonatomic, assign) UIStepper *boundedStepper;

@end

@implementation BTStepperNumber

@synthesize boundedStepper;

- (void)bindStepper:(UIStepper *)aStepper {
    self.boundedStepper = aStepper;
    if(self.boundedNumber){
        [self.boundedStepper setValue:self.boundedNumber.doubleValue];
    }else {
        self.boundedNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithInt:self.boundedStepper.value];
    }
    
    [self.boundedStepper addTarget:self
                            action:@selector(valueDidChanged:)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)valueDidChanged:(id)aSender {
    UIStepper *stepper = (UIStepper *)aSender;
    self.boundedNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:stepper.value];
}

- (NSString *)labelText {
    return [NSString stringWithFormat:@"%d", self.boundedNumber.intValue];
}

@end
