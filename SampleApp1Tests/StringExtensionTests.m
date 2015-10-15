//
//  StringExtensionTests.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+NSStringExtensions.h"

@interface StringExtensionTests : XCTestCase {
    @private NSString * normalString;
    @private NSString * reversedString;
    @private bool isNumericOnly;
    
}
@end

@implementation StringExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testStringReversalIsCaseInsensitive {
    [self givenAString:@"Mary Had A Little Lamb"];
    [self whenStringReversed];
    [self thenReversedStringIs: @"bmaL elttiL A daH yraM"];
}

-(void) testStringReversalWorksWithNumbers {
    [self givenAString:@"1234567890"];
    [self whenStringReversed];
    [self thenReversedStringIs: @"0987654321"];
}

-(void) testNumericString {
    [self givenAString:@"1234567890"];
    [self whenStringCheckedForNonNumericCharacters];
    [self thenStringContainsNumericCharactersOnly: true];
}

-(void) testNonNumericString {
    [self givenAString:@"lorem ipsum"];
    [self whenStringCheckedForNonNumericCharacters];
    [self thenStringContainsNumericCharactersOnly: false];
}

- (void)testNonNumericStringIsNotValid {
    [self givenAString:@"Cat in the hat"];
    [self whenStringCheckedForNonNumericCharacters];
    [self thenStringContainsNumericCharactersOnly:false];
}

- (void)testSpacesInNumericStringAreNotValid {
    [self givenAString:@"123 234 3456 3456"];
    [self whenStringCheckedForNonNumericCharacters];
    [self thenStringContainsNumericCharactersOnly:false];
}

- (void)testDecimalsInNumericStringAreNotValid {
    [self givenAString:@"123.234.3456.3456"];
    [self whenStringCheckedForNonNumericCharacters];
    [self thenStringContainsNumericCharactersOnly:false];
}

-(void) givenAString: (NSString *) string {
    normalString = string;
}

-(void) whenStringReversed {
    reversedString = [normalString reversedString];
}

-(void) whenStringCheckedForNonNumericCharacters {
    isNumericOnly = [normalString isNumericCharactersOnly];
}

-(void) thenReversedStringIs:(NSString *) string {
    XCTAssertTrue([reversedString isEqualToString:string], @"Expected reversed string to be %@ but was %@", string, reversedString);
}

-(void) thenStringContainsNumericCharactersOnly:(bool) numericOnly {
    XCTAssertTrue(isNumericOnly == numericOnly, @"Expected string to have %@ characters only", numericOnly ? @"numeric" : @"non-numeric");
}

@end
