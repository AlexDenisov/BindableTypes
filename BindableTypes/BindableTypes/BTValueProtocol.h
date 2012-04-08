//
//  BTValueProtocol.h
//  BindableTypes
//
//  Created by Alex Denisov on 05.04.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BTValueProtocol <NSObject>

@optional

- (void)valueDidChanged:(id)aValue;

@end
