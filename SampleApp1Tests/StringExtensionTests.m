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

-(void) givenAString: (NSString *) string {
    normalString = string;
}

-(void) whenStringReversed {
    reversedString = [normalString reversedString];
}

-(void) thenReversedStringIs:(NSString *) string {
    XCTAssertTrue([reversedString isEqualToString:string], @"Expected reversed string to be %@ but was %@", string, reversedString);
}

@end
