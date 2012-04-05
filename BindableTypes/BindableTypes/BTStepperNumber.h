//
//  BTStepperNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseNumber.h"

@interface BTStepperNumber : BTBaseNumber

@property (nonatomic, assign) UIStepper *boundedStepper;

- (void)bindStepper:(UIStepper *)aStepper;

@end
