//
//  BTString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTString.h"
#import "BTBaseString.h"
#import "BTTextFieldString.h"
#import "BTTextViewString.h"

@interface BTString ()
+ (const char *)sqlType;
- (NSString *)toSql;
+ (id)fromSql:(NSString *)sqlData;
@end

@implementation BTString

/*
 ActiveRecord Support
 https://github.com/AlexDenisov/iActiveRecord
 */

+ (const char *)sqlType {
    return (const char *)[NSString performSelector:@selector(sqlType)];
}
- (NSString *)toSql {
    return [[self stringValue] performSelector:@selector(toSql)];
}

+ (id)fromSql:(NSString *)sqlData {
    NSLog(@"%@", sqlData);
    NSString *string = [NSString performSelector:@selector(fromSql:) withObject:sqlData];
    NSLog(@"%@", string);
    return [[[BTBaseString alloc] initWithString:string] autorelease];
}

#pragma mark - 

- (void)bindLabel:(UILabel *)aLabel {}
- (NSString *)stringValue {return nil;}

#pragma mark - BTTextFieldString

+ (BTString *)stringWithTextField:(UITextField *)aTextField {
    return [self stringWithTextField:aTextField
                          withString:nil
                        withDelegate:nil];
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
    [string bindTextField:aTextField];
    [string setDelegate:aDelegate];
    return string;
}

#pragma mark - BTTextFieldString

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
                      withString:(NSString *)aString 
                    withDelegate:(id<UITextViewDelegate>)aDelegate 
{
    BTTextViewString *string = [[[BTTextViewString alloc] initWithString:aString] autorelease];
    [string bindTextView:aTextView];
    [string setDelegate:aDelegate];
    return string;
}

@end
