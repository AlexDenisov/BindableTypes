//
//  BTNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTNumber.h"
#import "BTSliderNumber.h"

@implementation BTNumber

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider {
    BTSliderNumber *number = [[[BTSliderNumber alloc] init] autorelease];
    [number bindWithSlider:aSlider];
    return number;
}

@end
