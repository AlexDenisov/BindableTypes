//
//  BTTextFieldString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTTextFieldString.h"

@interface BTTextFieldString ()
    <UITextFieldDelegate>

@property (nonatomic, assign) UITextField *boundedTextField;

@end

@implementation BTTextFieldString

@synthesize boundedTextField;

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if(self.boundedTextField.clearsOnBeginEditing){
        self.boundedString = @"";
    }
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if([self isDelegateRespondsToSelector:_cmd]){
        return [self.delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if([self isDelegateRespondsToSelector:_cmd]){
        return [self.delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField 
shouldChangeCharactersInRange:(NSRange)range 
replacementString:(NSString *)string 
{
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textField:textField
            shouldChangeCharactersInRange:range
                        replacementString:string];
    }
    if (result) {
        self.boundedString = [self.boundedTextField.text stringByReplacingCharactersInRange:range
                                                                                 withString:string];
    }
    return result;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textFieldShouldClear:textField];
    }
    if (result) {
        self.boundedString = @"";
    }
    return result;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textFieldShouldClear:textField];
    }
    if(result){
        [self.boundedTextField resignFirstResponder];
    }
    return result;
}

#pragma mark - 

- (BTString *)bindTextField:(UITextField *)aTextField {
    return [self bindTextField:aTextField
                  withDelegate:nil];
}

- (BTString *)bindTextField:(UITextField *)aTextField 
               withDelegate:(id<UITextFieldDelegate>)aDelegate
{
    self.boundedTextField = aTextField;
    self.delegate = aDelegate;
    [self.boundedTextField setDelegate:self];
    [self.boundedTextField setText:self.boundedString];
    self.boundedTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.boundedTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    return self;
}

- (void)unbind {
    self.boundedTextField.delegate = nil;
}

@end
