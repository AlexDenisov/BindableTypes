//
//  BTBaseNumber.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTNumber.h"

@interface BTBaseNumber : BTNumber

@property (nonatomic, retain) NSNumber *boundedNumber;
@property (nonatomic, assign) UILabel *boundedLabel;

- (id)initWithNumber:(NSNumber *)aNumber;
- (void)updateLabel;
- (NSString *)labelText;

@end
