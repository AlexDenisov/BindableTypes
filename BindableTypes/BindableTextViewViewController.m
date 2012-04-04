//
//  BindableTextViewViewController.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BindableTextViewViewController.h"
#import "BTString.h"

@interface BindableTextViewViewController ()

@end

@implementation BindableTextViewViewController

@synthesize descriptionTextView;
@synthesize descriptionLabel;
@synthesize descriptionString;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.descriptionString = [BTString stringWithTextView:self.descriptionTextView];
    [self.descriptionString bindLabel:self.descriptionLabel];
}

- (void)dealloc {
    self.descriptionString = nil;
    [descriptionTextView release];
    [descriptionLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setDescriptionTextView:nil];
    [self setDescriptionLabel:nil];
    [super viewDidUnload];
}
@end
