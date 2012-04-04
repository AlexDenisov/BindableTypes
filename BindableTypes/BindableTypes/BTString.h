//
//  BTString.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTString : NSObject

//  bind with text field
- (BTString *)bindTextField:(UITextField *)aTextField;
- (BTString *)bindTextField:(UITextField *)aTextField 
                          withDelegate:(id<UITextFieldDelegate>)aDelegate;
//  bind with text view
- (BTString *)bindTextView:(UITextView *)aTextView;
- (BTString *)bindTextView:(UITextView *)aTextView 
              withDelegate:(id<UITextViewDelegate>)aDelegate;

//  bind with label
- (BTString *)bindLabel:(UILabel *)aLabel;

- (BTString *)unbind;

- (id)initWithString:(NSString *)aString;
- (NSString *)stringValue;

@end
