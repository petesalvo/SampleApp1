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


@end
