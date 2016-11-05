//
//  main.m
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DollarValueGen.h"
#import "InputHandler.h"
#import "PaymentGateway.h"
#import "AmazonPaymentService.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "ApplePayPaymentService.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
     
        DollarValueGen *dollarGenerator = [[DollarValueGen alloc] init];
        InputHandler *inputHandler = [[InputHandler alloc] init];
        PaymentGateway *paymentGateway = [[PaymentGateway alloc] init];
        AmazonPaymentService *amazon;
        PaypalPaymentService *paypal;
        StripePaymentService *stripe;
        ApplePayPaymentService *applePay;
        BOOL isPaymentProcessed = NO;
            
        NSInteger price = [dollarGenerator generatePrice];
        
        while (isPaymentProcessed == NO) {
            
            NSString *paymentPrompt = [NSString stringWithFormat:@"Thank you for shopping at Acme.com Your total today is $%ld Please select your payment method: Paypal, Stripe, or Amazon, ApplePay", price];
            
            NSInteger paymentMethod;
            paymentMethod = [inputHandler getPaymentMethod:paymentPrompt];
            
            switch (paymentMethod)
            {
                case 1:
                    paypal = [[PaypalPaymentService alloc] init];
                    paymentGateway.delegate = paypal;
                    isPaymentProcessed = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 2:
                    stripe = [[StripePaymentService alloc] init];
                    paymentGateway.delegate = stripe;
                    isPaymentProcessed = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 3:
                    amazon = [[AmazonPaymentService alloc] init];
                    paymentGateway.delegate = amazon;
                    isPaymentProcessed = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 4:
                    applePay = [[ApplePayPaymentService alloc] init];
                    paymentGateway.delegate = applePay;
                    isPaymentProcessed = [paymentGateway.delegate processPaymentAmount: price];
                    break;
            }
        }
    }
    return 0;
}
