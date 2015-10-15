//
//  NSString+NSStringExtensions.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import "NSString+NSStringExtensions.h"

@implementation NSString (NSStringExtensions)

-(NSMutableString *) reversedString {
    
    NSMutableString * stringToReturn = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0,[self length])
                                 options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                  [stringToReturn appendString:substring];
                              }];
    return stringToReturn;
}

-(bool) isNumericCharactersOnly {
    return [self rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound;
}

@end
