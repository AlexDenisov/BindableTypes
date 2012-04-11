//
//  BTSliderNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTSliderNumber.h"

@interface BTSliderNumber ()

@property (nonatomic, retain) UISlider *boundedSlider;

@end

@implementation BTSliderNumber

@synthesize boundedSlider;

- (void)bindSlider:(UISlider *)aSlider {
    self.boundedSlider = aSlider;
    if(self.boundedNumber){
        [self.boundedSlider setValue:self.boundedNumber.floatValue];
    }else{
        self.boundedNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithFloat:self.boundedSlider.value];
    }
    [self.boundedSlider addTarget:self
                           action:@selector(valueDidChanged:)
                 forControlEvents:UIControlEventValueChanged];
}

- (void)valueDidChanged:(id)aSender {
    UISlider *slider = (UISlider *)aSender;
    self.boundedNumber = (NSDecimalNumber *)[NSDecimalNumber numberWithFloat:slider.value];
}

- (NSString *)labelText {
    return [NSString stringWithFormat:@"%.2f", self.boundedNumber.floatValue];
}

@end
