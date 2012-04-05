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
@synthesize boundedLabel;

- (id)init {
    return [self initWithNumber:nil];
}

- (id)initWithNumber:(NSNumber *)aNumber {
    self = [super init];
    if(self){
        [self addObserver:self
               forKeyPath:@"boundedNumber"
                  options:0
                  context:nil];
        self.boundedNumber = aNumber;
    }
    return self;
}

- (NSNumber *)numberValue {
    return self.boundedNumber;
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context
{
    if([keyPath isEqualToString:@"boundedNumber"]){
        [self updateLabel];
    }
}

- (void)updateLabel {
    [self.boundedLabel setText:[self labelText]];
}

- (void)bindLabel:(UILabel *)aLabel {
    self.boundedLabel = aLabel;
    [self updateLabel];
}

- (NSString *)labelText {return  nil;}

@end
