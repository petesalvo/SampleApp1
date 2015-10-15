//
//  ECCreditCard.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import "ECCreditCard.h"
#import "CheckDigitValidator.h"

@interface ECCreditCard() {
    @private NSString * bankCardNumber;
    @private BankCardIssuer bankCardIssuer;
}

@end

static NSString * AMEX_REGEX       = @"^3[47][0-9]{5,}$";
static NSString * DISCOVER_REGEX  = @"^6(?:011|5[0-9]{2})[0-9]{3,}$";
static NSString * MASTERCARD_REGEX = @"^5[1-5][0-9]{5,}$";
static NSString * VISA_REGEX       = @"^4[0-9]{6,}$";

@implementation ECCreditCard

-(id) initWithCardNumber:(NSString *)number  {
    if (!(self = [super init])) {
        return nil;
    }
    
    bankCardNumber = number;
    bankCardIssuer   = [self determineCardIssuer];
    
    return self;
}

-(bool) isValidCardNumber {
    
    if (!bankCardNumber) return false;

    int cardLength = (int) [bankCardNumber length];
    switch (bankCardIssuer) {
        case AmericanExpress:
            if (cardLength != 15) return false;
            break;
        case Discover:
        case MasterCard:
            if (cardLength != 16) return false;
            break;
        case Visa:
            if ((cardLength != 13) && (cardLength != 16)) return false;
            break;
        case Unknown:
        default:
            return false;
        break;
    }
    
    if (![CheckDigitValidator isValidCheckDigit: bankCardNumber]) return false;
    
    return true;
}


-(BankCardIssuer) cardIssuer {
    return bankCardIssuer;
}

-(BankCardIssuer) determineCardIssuer {

    if ([self matchesRegex: AMEX_REGEX]) return AmericanExpress;
    if ([self matchesRegex: DISCOVER_REGEX]) return Discover;
    if ([self matchesRegex: MASTERCARD_REGEX]) return MasterCard;
    if ([self matchesRegex: VISA_REGEX]) return Visa;    
    
    return Unknown;
    
}

-(bool) matchesRegex: (NSString *) regex {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:bankCardNumber];
}

@end
