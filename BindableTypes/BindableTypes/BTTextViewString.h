//
//  BTTextViewString.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseString.h"

@interface BTTextViewString : BTBaseString

//  bind with text view
- (BTString *)bindTextView:(UITextView *)aTextView;
- (BTString *)bindTextView:(UITextView *)aTextView 
              withDelegate:(id<UITextViewDelegate>)aDelegate;

@end
