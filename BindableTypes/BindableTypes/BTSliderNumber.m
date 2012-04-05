//
//  BTSliderNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTSliderNumber.h"

@implementation BTSliderNumber

@synthesize boundedSlider;

- (void)bindWithSlider:(UISlider *)aSlider {
    self.boundedSlider = aSlider;
    [self.boundedSlider addTarget:self
                           action:@selector(valueDidChanged:)
                 forControlEvents:UIControlEventValueChanged];
}

- (void)valueDidChanged:(id)aSender {
    UISlider *slider = (UISlider *)aSender;
    self.boundedNumber = [NSNumber numberWithFloat:slider.value];
}

- (NSString *)labelText {
    if(self.boundedNumber == nil){
        return @"0";
    }
    return [NSString stringWithFormat:@"%.2f", [self.boundedNumber floatValue]];
}

@end
