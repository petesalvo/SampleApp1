//
//  ECCreditCardTests.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ECCreditCard.h"

@interface ECCreditCardTests : XCTestCase {
    NSString * cardNumber;
    ECCreditCard * creditCard;
}

@end

@implementation ECCreditCardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCardTooLongIsInvalid {
    [self givenACardNumber:@"12345678901234567890"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
}


-(void)testCardTooShortIsInvalid {
    [self givenACardNumber:@"123456789"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
}

-(void)testCardWithNonNumericCharsIsInvalid {
    [self givenACardNumber:@"Lorem ipsum"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
}

-(void)testInstantiatCardWithNilWillNotCrash {
    [self givenACardNumber:nil];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
}

-(void) testValidAmericanExpress {
    [self givenACardNumber:@"378282246310005"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:AmericanExpress];
}

-(void) testValidAmericanExpressTwo {
    [self givenACardNumber:@"371449635398431"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:AmericanExpress];
}

-(void) testValidAmericanExpressCorporate {
    [self givenACardNumber:@"378734493671000"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:AmericanExpress];
}

-(void) testValidDiscover {
    [self givenACardNumber:@"6011111111111117"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:Discover];
}

-(void) testValidDiscoverTwo {
    [self givenACardNumber:@"6011000990139424"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:Discover];
}

-(void) testValidMastercardOne {
    [self givenACardNumber:@"5555555555554444"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:MasterCard];
}

-(void) testValidMastercardTwo {
    [self givenACardNumber:@"5105105105105100"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:MasterCard];
}

-(void) testValidVisaOne {
    [self givenACardNumber:@"4111111111111111"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:Visa];
}

-(void) testValidVisaTwo {
    [self givenACardNumber:@"4012888888881881"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:Visa];
}

-(void) testValidVisa13Characters {
    [self givenACardNumber:@"4222222222222"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardTypeIs:Visa];
}

#pragma mark - BDD utility methods

-(void) givenACardNumber:(NSString *) number {
    cardNumber = number;
}

-(void) whenCreditCardObjectInitialized {
    creditCard = [[ECCreditCard alloc] initWithCardNumber:cardNumber];

}

-(void) thenCardNumberIsValid: (bool) valid {
    bool isValidCardNumber = creditCard.isValidCardNumber;
    XCTAssertTrue(valid == isValidCardNumber, @"Expected card number to be %@", valid ? @"valid" : @"invalid");
}

-(void) thenCardTypeIs: (BankCardType) cardType {
    BankCardType bankCardType = creditCard.cardType;
    XCTAssertTrue(bankCardType == cardType, @"Incorrect card type");
}


@end
