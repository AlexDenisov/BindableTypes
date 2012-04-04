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

- (id)initWithNumber:(NSNumber *)aNumber;


@end
