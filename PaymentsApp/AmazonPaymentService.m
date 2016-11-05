//
//  AmazonPaymentService.m
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "AmazonPaymentService.h"

@interface AmazonPaymentService ()

- (BOOL)processPaymentAmount:(NSInteger)price;
- (void)randBOOL;

@end


@implementation AmazonPaymentService

- (BOOL)processPaymentAmount:(NSInteger)price
{
    [self randBOOL];
    if (self.canProcessPayment == NO)
    {
        NSLog(@"Amazon is sorry to inform you that it cannot process your payment at this time.");
        return NO;
    }
    else
    {
        NSLog(@"Amazon has processed your payment of $%ld", price);
        return YES;
    }
}

- (void)randBOOL
{
    int lowerBound = 0;
    int upperBound = 2;
    int rndValue = lowerBound + (arc4random() % (upperBound - lowerBound));
    
    if (rndValue == 0)
    {
        self.canProcessPayment = NO;
    }
    else
    {
        self.canProcessPayment = YES;
    }
}

@end
