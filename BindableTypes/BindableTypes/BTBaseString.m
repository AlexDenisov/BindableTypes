//
//  BTBaseString.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseString.h"

@interface BTBaseString ()
+ (const char *)sqlType;
- (NSString *)toSql;
+ (id)fromSql:(NSString *)sqlData;
@end

@implementation BTBaseString

/*
 ActiveRecord Support
 https://github.com/AlexDenisov/iActiveRecord
 */

+ (const char *)sqlType {
    return (const char *)[NSString performSelector:@selector(sqlType)];
}
- (NSString *)toSql {
    return [self.boundedString performSelector:@selector(toSql)];
}
+ (id)fromSql:(NSString *)sqlData {
    return [NSString performSelector:@selector(fromSql:) withObject:sqlData];
}

@synthesize boundedString;
@synthesize boundedLabel;
@synthesize delegate;

#pragma mark - Observe value

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
    self.boundedString = nil;
    [super dealloc];
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context
{
    if([keyPath isEqualToString:@"boundedString"]){
        if([self isDelegateRespondsToSelector:@selector(valueDidChanged:)]){
            [self.delegate valueDidChanged:self.boundedString];
        }
        [self updateLabel];
    }
}

- (void)updateLabel {
    [self.boundedLabel setText:self.boundedString];
}

- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector {
    return [self.delegate respondsToSelector:aSelector];
}

- (NSString *)stringValue {
    return self.boundedString;
}

- (void)bindLabel:(UILabel *)aLabel {
    self.boundedLabel = aLabel;
    [self updateLabel];
}

@end
