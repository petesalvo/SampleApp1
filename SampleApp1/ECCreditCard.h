//
//  ECCreditCard.h
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Unknown          = 0,
    AmericanExpress  = 1,
    Discover         = 2,
    MasterCard       = 3,
    Visa             = 4
} BankCardType;


@interface ECCreditCard : NSObject

@property (nonatomic, readonly) bool isValidCardNumber;
@property (nonatomic, readonly) BankCardType cardType;

-(id) initWithCardNumber: (NSString *) number;

@end
