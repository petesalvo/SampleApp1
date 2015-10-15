//
//  CheckDigitValidator.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/15/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckDigitValidator.h"
#import "NSString+NSStringExtensions.h"


@implementation CheckDigitValidator

+(bool) isValidCheckDigit : (NSString *) stringToVerify {
    
    if (![stringToVerify isNumericCharactersOnly]) return false;
    
    NSMutableString * reversedString = [stringToVerify reversedString];
    
    int sumOfOddDigits  = 0;
    int sumOfEvenDigits = 0;
    
    for (int i = 0; i < [reversedString length]; i++) {
        int currentDigit = [[NSString stringWithFormat:@"%C", [reversedString characterAtIndex:i]] intValue];
        
        if (i % 2 == 0) {
            sumOfEvenDigits += currentDigit;
        } else {
            sumOfOddDigits += currentDigit / 5 + (2 * currentDigit) % 10;
        }
    }
    
    return (sumOfOddDigits + sumOfEvenDigits) % 10 == 0;
}

@end