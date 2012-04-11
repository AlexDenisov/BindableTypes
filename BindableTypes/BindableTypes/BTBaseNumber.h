//
//  BTBaseNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTNumber.h"

@interface BTBaseNumber : BTNumber

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSDecimalNumber *boundedNumber;
@property (nonatomic, assign) UILabel *boundedLabel;

- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector;
- (id)initWithNumber:(NSNumber *)aNumber;
- (void)updateLabel;
- (NSString *)labelText;
- (void)valueDidChanged:(id)aSender;

@end
