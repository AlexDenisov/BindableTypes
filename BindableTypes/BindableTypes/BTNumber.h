//
//  BTNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTValueProtocol.h"

@interface BTNumber : NSObject

#pragma mark - BTNumber with UISlider

+ (BTNumber *)numberWithSlider:(UISlider *)aSlider;
+ (BTNumber *)numberWithSlider:(UISlider *)aSlider 
                    withNumber:(NSNumber *)aNumber;
+ (BTNumber *)numberWithSlider:(UISlider *)aSlider 
                    withNumber:(NSNumber *)aNumber 
                  withDelegate:(id<BTValueProtocol>)aDelegate;

#pragma mark - BTNumber with UIStepper

+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper;
+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper 
                     withNumber:(NSNumber *)aNumber;
+ (BTNumber *)numberWithStepper:(UIStepper *)aStepper 
                     withNumber:(NSNumber *)aNumber 
                   withDelegate:(id<BTValueProtocol>)aDelegate;

#pragma mark - BTNumber with UISwitch

+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch;
+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch 
                    withNumber:(NSNumber *)aNumber;
+ (BTNumber *)numberWithSwitch:(UISwitch *)aSwitch 
                    withNumber:(NSNumber *)aNumber 
                  withDelegate:(id<BTValueProtocol>)aDelegate;

#pragma mark - 

- (void)bindLabel:(UILabel *)aLabel;
- (NSNumber *)numberValue;

@end
