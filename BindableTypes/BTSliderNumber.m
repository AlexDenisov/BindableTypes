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
    NSLog(@"%@", aSender);
}

@end
