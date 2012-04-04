//
//  BTBaseNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseNumber.h"

@implementation BTBaseNumber

@synthesize boundedNumber;

- (id)initWithNumber:(NSNumber *)aNumber {
    self = [super init];
    if(self){
        self.boundedNumber = aNumber;
    }
    return self;
}

@end
