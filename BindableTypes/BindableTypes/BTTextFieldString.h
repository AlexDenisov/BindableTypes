//
//  BTTextFieldString.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseString.h"

@interface BTTextFieldString : BTBaseString
- (BTString *)bindTextField:(UITextField *)aTextField;
@end
