//
//  ECCreditCard.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import "ECCreditCard.h"

@interface ECCreditCard() {

    @private NSString * cardNumber;
    @private BankCardType cardType;

}
@end

static NSString * AMEX_REGEX       = @"^3[47][0-9]{5,}$";
static NSString * DISCOVERY_REGEX  = @"^6(?:011|5[0-9]{2})[0-9]{3,}$";
static NSString * MASTERCARD_REGEX = @"^5[1-5][0-9]{5,}$";
static NSString * VISA_REGEX       = @"^4[0-9]{6,}$";


@implementation ECCreditCard

-(id) initWithCardNumber:(NSString *)number  {
    if (!(self = [super init])) {
        return nil;
    }
    
    cardNumber = number;
    cardType   = [self determineCardType];
    
    return self;
}

-(bool) isValidCardNumber {
    
    if (!cardNumber) return false;
    

    
    
    switch (cardType) {
        case AmericanExpress:
            if ([cardNumber length] != 15) return false;
        break;
        
        case Unknown:
        default:
            return false;
        break;
    }
    
    
    return true;
}

-(BankCardType) cardType {
    return self.cardType;
}


-(bool) isNumericCharactersOnly {
    return [cardNumber rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound;

}

-(BankCardType) determineCardType {

    if (![self isNumericCharactersOnly]) return Unknown;
    
    if ([self isAmex]) {
        return AmericanExpress;
    } else {
        return Unknown;
    }
    
}

-(bool) isAmex {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", AMEX_REGEX];
    return [predicate evaluateWithObject:cardNumber];
}

@end
