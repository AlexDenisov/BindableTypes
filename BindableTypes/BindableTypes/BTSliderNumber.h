//
//  BTSliderNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseNumber.h"

@interface BTSliderNumber : BTBaseNumber

@property (nonatomic, retain) UISlider *boundedSlider;

- (void)bindWithSlider:(UISlider *)aSlider;

- (void)valueDidChanged:(id)aSender;

@end
