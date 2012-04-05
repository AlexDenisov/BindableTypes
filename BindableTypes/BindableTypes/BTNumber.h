//
//  BTNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTNumber : NSObject

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider;
+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper;
+ (BTNumber *)numberwithSwitch:(UISwitch *)aSwitch;

- (void)bindLabel:(UILabel *)aLabel;

- (NSNumber *)numberValue;

@end
