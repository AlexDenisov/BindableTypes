//
//  BTTextViewString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTTextViewString.h"

@interface BTTextViewString ()
    <UITextViewDelegate>
@property (nonatomic, assign) UITextView *boundedTextView;

@end

@implementation BTTextViewString

@synthesize boundedTextView;

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

- (BOOL)textView:(UITextView *)textView 
shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text 
{
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

- (void)unbind {
    self.boundedTextView.delegate = nil;
}

@end
