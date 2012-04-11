//
//  BTBaseNumber.m
//  BindableTypes
//
//  Created by Alex Denisov on 04.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "BTBaseNumber.h"

@interface BTBaseNumber ()
/*
 ActiveRecord Support
 https://github.com/AlexDenisov/iActiveRecord
 */

+ (const char *)sqlType;
- (NSString *)toSql;
+ (id)fromSql:(NSString *)sqlData;
@end

@implementation BTBaseNumber

/*
 ActiveRecord Support
 https://github.com/AlexDenisov/iActiveRecord
 */

+ (const char *)sqlType {
    return (const char *)[NSDecimalNumber performSelector:@selector(sqlType)];
}
- (NSString *)toSql {
    return [self.boundedNumber performSelector:@selector(toSql)];
}
+ (id)fromSql:(NSString *)sqlData {
    NSNumber *number = [NSDecimalNumber performSelector:@selector(fromSql:) 
                                             withObject:sqlData];
    return [[[BTBaseNumber alloc] initWithNumber:number] autorelease];
}

@synthesize boundedNumber;
@synthesize boundedLabel;
@synthesize delegate;

- (id)init {
    return [self initWithNumber:nil];
}

- (id)initWithNumber:(NSNumber *)aNumber {
    self = [super init];
    if(self){
        [self addObserver:self
               forKeyPath:@"boundedNumber"
                  options:0
                  context:nil];
        self.boundedNumber = (NSDecimalNumber *)aNumber;
    }
    return self;
}

- (void)dealloc {
    self.boundedNumber = nil;
    [super dealloc];
}

- (NSNumber *)numberValue {
    return self.boundedNumber;
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context
{
    if([keyPath isEqualToString:@"boundedNumber"]){
        if([self isDelegateRespondsToSelector:@selector(valueDidChanged:)]){
            [self.delegate valueDidChanged:self.boundedNumber];
        }
        [self updateLabel];
    }
}

- (BOOL)isDelegateRespondsToSelector:(SEL)aSelector {
    return [self.delegate respondsToSelector:aSelector];
}

- (void)updateLabel {
    [self.boundedLabel setText:[self labelText]];
}

- (void)bindLabel:(UILabel *)aLabel {
    self.boundedLabel = aLabel;
    [self updateLabel];
}

- (NSString *)labelText {return  nil;}
- (void)valueDidChanged:(id)aSender {}

@end
