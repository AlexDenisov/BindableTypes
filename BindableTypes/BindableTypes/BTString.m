//
//  BTString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTString.h"
#import "BTTextFieldString.h"
#import "BTTextViewString.h"

@implementation BTString

#pragma mark - 

- (void)unbind {}
- (void)bindLabel:(UILabel *)aLabel {}
- (NSString *)stringValue {return nil;}

#pragma mark - BTTextFieldString

+ (BTString *)stringWithTextField:(UITextField *)aTextField {
    return [self stringWithTextField:aTextField
                        withDelegate:nil];
}

+ (BTString *)stringWithTextField:(UITextField *)aTextField 
                     withDelegate:(id<UITextFieldDelegate>)aDelegate
{
    return [self stringWithTextField:aTextField
                          withString:nil
                        withDelegate:aDelegate];
}

+ (BTString *)stringWithTextField:(UITextField *)aTextField 
                       withString:(NSString *)aString
{
    return [self stringWithTextField:aTextField
                          withString:aString
                        withDelegate:nil];
}

+ (BTString *)stringWithTextField:(UITextField *)aTextField 
                       withString:(NSString *)aString 
                     withDelegate:(id<UITextFieldDelegate>)aDelegate
{
    BTTextFieldString *string = [[[BTTextFieldString alloc] initWithString:aString] autorelease];
    [string bindTextField:aTextField withDelegate:aDelegate];
    return string;
}

+ (BTString *)stringWithTextView:(UITextView *)aTextView {
    return [self stringWithTextView:aTextView
                         withString:nil
                       withDelegate:nil];
}

+ (BTString *)stringWithTextView:(UITextView *)aTextView 
                      withString:(NSString *)aString 
{
    return [self stringWithTextView:aTextView
                         withString:aString
                       withDelegate:nil];
}

+ (BTString *)stringWithTextView:(UITextView *)aTextView 
                    withDelegate:(id<UITextViewDelegate>)aDelegate 
{
    return [self stringWithTextView:aTextView
                         withString:nil
                       withDelegate:aDelegate];
}

+ (BTString *)stringWithTextView:(UITextView *)aTextView 
                      withString:(NSString *)aString 
                    withDelegate:(id<UITextViewDelegate>)aDelegate 
{
    BTTextViewString *string = [[[BTTextViewString alloc] initWithString:aString] autorelease];
    [string bindTextView:aTextView withDelegate:aDelegate];
    return string;
}

@end
