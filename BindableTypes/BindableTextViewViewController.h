//
//  BindableTextViewViewController.h
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BTString;

@interface BindableTextViewViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (retain, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, retain) BTString *descriptionString;

@end
