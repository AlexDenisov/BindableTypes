//
//  BTString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTString.h"

@interface BTString ()
    <UITextFieldDelegate, 
    UITextViewDelegate>

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) UITextField *boundedTextField;
@property (nonatomic, assign) UITextView *boundedTextView;

@property (nonatomic, assign) UILabel *boundedLabel;

@property (nonatomic, copy) NSString *boundedString;

- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector;
- (void)updateLabel;

@end

@implementation BTString

#pragma mark - Private interface

@synthesize delegate;
@synthesize boundedTextField;
@synthesize boundedTextView;
@synthesize boundedString;
@synthesize boundedLabel;

- (id)init {
    return [self initWithString:@""];
}

- (id)initWithString:(NSString *)aString {
    self = [super init];
    if(self != nil){
        [self addObserver:self
               forKeyPath:@"boundedString"
                  options:0
                  context:nil];
        self.boundedString = aString;
    }
    return self;
}

- (void)dealloc {
    [self unbind];
    self.boundedString = nil;
    [super dealloc];
}

- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector {
    return [self.delegate respondsToSelector:aSelector];
}

#pragma mark - Observe value

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context
{
    if([keyPath isEqualToString:@"boundedString"]){
        [self updateLabel];
    }
}

- (void)updateLabel {
    [self.boundedLabel setText:self.boundedString];
}

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

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textViewShouldBeginEditing:textView];
    }
    return result;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textViewShouldEndEditing:textView];
    }
    return result;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    BOOL result = YES;
    if([self isDelegateRespondsToSelector:_cmd]){
        result = [self.delegate textView:textView
                 shouldChangeTextInRange:range
                         replacementText:text];
    }
    if(result){
        self.boundedString = [textView.text stringByReplacingCharactersInRange:range
                                                                    withString:text];
    }
    return result;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textViewDidBeginEditing:textView];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textViewDidEndEditing:textView];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if([self isDelegateRespondsToSelector:_cmd]){
        [self.delegate textViewDidChangeSelection:textView];
    }
}

#pragma mark - Public interface

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

- (BTString *)bindTextView:(UITextView *)aTextView {
    return [self bindTextView:aTextView
                 withDelegate:nil];
}

- (BTString *)bindTextView:(UITextView *)aTextView 
              withDelegate:(id<UITextViewDelegate>)aDelegate
{
    self.boundedTextView = aTextView;
    self.delegate = aDelegate;
    [self.boundedTextView setDelegate:self];
    [self.boundedTextView setText:self.boundedString];
    self.boundedTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.boundedTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    return self;
}

- (BTString *)bindLabel:(UILabel *)aLabel {
    self.boundedLabel = aLabel;
    [self updateLabel];
    return self;
}

- (BTString *)unbind {
    self.boundedTextField.delegate = nil;
    return self;
}

- (NSString *)stringValue {
    return self.boundedString;
}

@end
