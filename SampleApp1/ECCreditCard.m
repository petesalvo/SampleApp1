//
//  ECCreditCard.m
//  SampleApp1
//
//  Created by Salvo, Pete on 10/14/15.
//  Copyright © 2015 Salvo, Pete. All rights reserved.
//

#import "ECCreditCard.h"

@interface ECCreditCard()
    @property (nonatomic, strong) NSString * _cardNumber;
@end

@implementation ECCreditCard

-(id) initWith:(NSString *)cardNumber {
    if (!(self = [super init])) {
        return nil;
    }
    
    return self;
}

@end
