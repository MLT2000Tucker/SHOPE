//
//  Categories.m
//  IRCT-iPad
//
//  Created by Michael Tucker on 8/4/12.
//  Copyright (c) 2012 Zenith Marketing Group. All rights reserved.
//

#import "Categories.h"

@implementation NSArray(NSArraySortExtensions)

- (NSArray *)sortAscending 
{
    return [self sortedArrayUsingSelector: @selector(caseInsensitiveCompare:)];
}

- (NSArray *)sortDescending 
{
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    return [self sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
}

@end

@implementation NSObject (AdditionalMethod)
-(BOOL) isNotEmpty
{
//NSLog(@"In isNotEmpty");
    return !(self == nil
             || [self isKindOfClass:[NSNull class]]
             || ([self respondsToSelector:@selector(length)]
                 && [(NSData *)self length] == 0)
             || ([self respondsToSelector:@selector(count)]
                 && [(NSArray *)self count] == 0));
    
};
@end
