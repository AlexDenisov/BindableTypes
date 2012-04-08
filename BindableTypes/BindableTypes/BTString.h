//
//  BTString.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTValueProtocol.h"

@interface BTString : NSObject

+ (BTString *)stringWithTextField:(UITextField *)aTextField;
+ (BTString *)stringWithTextField:(UITextField *)aTextField 
                       withString:(NSString *)aString;
+ (BTString *)stringWithTextField:(UITextField *)aTextField 
                       withString:(NSString *)aString 
                     withDelegate:(id<UITextFieldDelegate, BTValueProtocol>)aDelegate;

+ (BTString *)stringWithTextView:(UITextView *)aTextView;
+ (BTString *)stringWithTextView:(UITextView *)aTextView 
                      withString:(NSString *)aString;
+ (BTString *)stringWithTextView:(UITextView *)aTextView 
                      withString:(NSString *)aString 
                    withDelegate:(id<UITextViewDelegate, BTValueProtocol>)aDelegate;

- (void)bindLabel:(UILabel *)aLabel;
- (NSString *)stringValue;

@end
