//
//  CheckDigitValidator.h
//  SampleApp1
//
//  Created by Salvo, Pete on 10/15/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CheckDigitValidator : NSObject

+(bool) isValidCheckDigit : (NSString *) stringToVerify;


@end
