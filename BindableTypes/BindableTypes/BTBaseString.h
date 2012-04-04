//
//  BTBaseString.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTString.h"

@interface BTBaseString : BTString

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) UILabel *boundedLabel;
@property (nonatomic, copy) NSString *boundedString;

- (id)initWithString:(NSString *)aString;
- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector;
- (void)updateLabel;

@end
