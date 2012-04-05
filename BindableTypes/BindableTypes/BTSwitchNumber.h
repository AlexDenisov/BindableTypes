//
//  BTSwitchNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseNumber.h"

@interface BTSwitchNumber : BTBaseNumber

@property (nonatomic, assign) UISwitch *boundedSwitch;

- (void)bindSwitch:(UISwitch *)aSwitch;

@end
