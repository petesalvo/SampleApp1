//
//  CheckDigitValidatorTests.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/15/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CheckDigitValidator.h"

@interface CheckDigitValidatorTests : XCTestCase {
    @private NSString * stringToVerify;
    @private bool isValid;
}

@end

@implementation CheckDigitValidatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testExampleWhereOddAndEvenNumbersAddToPowerOfTen {
    
    // Odd Numbers:  1 9 2 8 3 7 4 6 5 5 6 4 7 3 8 2 9 1   == sum 90
    // Even numbers:  1 9 2 8 3 7 4 6 5 5 6 4 7 3 8 2 9 1  == sum 90
    // Combined:     119922883377446655556644773388229911     180 % 10 == 0
    
    [self givenAStringToVerify:@"119922883377446655556644773388229911"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:true];
}

- (void)testValidKnownString {
    [self givenAStringToVerify:@"79927398713"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:true];
}

- (void)testValidKnownStringTwo {
    [self givenAStringToVerify:@"1111111111111117"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:true];
}

- (void)testValidKnownStringThree {
    [self givenAStringToVerify:@"2222222222222224"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:true];
}

- (void)testInValidKnownString {
    [self givenAStringToVerify:@"79927398719"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:false];
}

- (void)testInValidKnownStringTwo {
    [self givenAStringToVerify:@"8675309"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:false];
}

- (void)testAllZerosIsValid {
    [self givenAStringToVerify:@"0000000000"];
    [self whenCheckDigitValidated];
    [self thenCheckDigitIsValid:true];
}




#pragma mark - BDD utility methods

-(void) givenAStringToVerify: (NSString *) string {
    stringToVerify = string;
}

-(void) whenCheckDigitValidated {
    isValid = [CheckDigitValidator isValidCheckDigit:stringToVerify];
}

-(void) thenCheckDigitIsValid: (bool) valid {
    XCTAssertTrue(valid == isValid, @"Expected check digit to be %@", valid ? @"valid" : @"invalid");
}

@end
