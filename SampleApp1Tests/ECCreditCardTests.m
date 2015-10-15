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
    @private NSString * cardNumber;
    @private ECCreditCard * creditCard;
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
    [self thenCardIssuerIs:Unknown];
}

-(void)testCardTooShortIsInvalid {
    [self givenACardNumber:@"123456789"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Unknown];
}

-(void)testCardWithNonNumericCharsIsInvalid {
    [self givenACardNumber:@"Lorem ipsum"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Unknown];
}

- (void)testCardNumberWithSpacesIsInvalid {
    [self givenACardNumber:@"4046 4867 1418 3026"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Unknown];
}

// Fun fact: I remember random sequences of numbers. This was my credit card number in college.
// It is (of course) no longer active...

- (void)testSameCardNumberWithoutSpacesIsInvalid {
    [self givenACardNumber:@"4046486714183026"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Visa];
}

-(void)testInstantiatCardWithNilWillNotCrash {
    [self givenACardNumber:nil];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Unknown];
}

-(void) testValidAmericanExpress {
    [self givenACardNumber:@"378282246310005"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:AmericanExpress];
}

-(void) testValidAmericanExpressTwo {
    [self givenACardNumber:@"371449635398431"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:AmericanExpress];
}

-(void) testValidAmericanExpressCorporate {
    [self givenACardNumber:@"378734493671000"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:AmericanExpress];
}

-(void) testValidDiscover {
    [self givenACardNumber:@"6011111111111117"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Discover];
}

-(void) testValidDiscoverTwo {
    [self givenACardNumber:@"6011000990139424"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Discover];
}

-(void) testValidMastercardOne {
    [self givenACardNumber:@"5555555555554444"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:MasterCard];
}

-(void) testValidMastercardTwo {
    [self givenACardNumber:@"5105105105105100"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:MasterCard];
}

-(void) testValidVisaOne {
    [self givenACardNumber:@"4111111111111111"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Visa];
}

-(void) testValidVisaTwo {
    [self givenACardNumber:@"4012888888881881"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Visa];
}

-(void) testValidVisa13Characters {
    [self givenACardNumber:@"4222222222222"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:true];
    [self thenCardIssuerIs:Visa];
}

-(void) testVisaWith13CharactersWithBadCheckDigitIsInvalid {
    [self givenACardNumber:@"4222222222221"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Visa];
}

// For the purposes of this Sample App, JCB cards are considered invalid
-(void) testValidJCBCardIsConsideredInvalid {
    [self givenACardNumber:@"3566002020360505"];
    [self whenCreditCardObjectInitialized];
    [self thenCardNumberIsValid:false];
    [self thenCardIssuerIs:Unknown];
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

-(void) thenCardIssuerIs: (BankCardIssuer) issuer {
    BankCardIssuer cardIssuer = creditCard.cardIssuer;
    XCTAssertTrue(issuer == cardIssuer, @"Incorrect card type");
}


@end
