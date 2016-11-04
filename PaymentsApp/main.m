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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        DollarValueGen *dollarGenerator = [[DollarValueGen alloc] init];
        InputHandler *inputHandler = [[InputHandler alloc] init];
        PaymentGateway *paymentGateway = [[PaymentGateway alloc] init];
        AmazonPaymentService *amazon = [[AmazonPaymentService alloc] init];
        PaypalPaymentService *paypal = [[PaypalPaymentService alloc] init];
        StripePaymentService *stripe = [[StripePaymentService alloc] init];
        ApplePayPaymentService *applePay = [[ApplePayPaymentService alloc] init];
        BOOL isProcessedPayment = NO;
            
        NSInteger price = [dollarGenerator generatePrice];
        
        while (isProcessedPayment == NO) {
            
            NSString *paymentPrompt = [NSString stringWithFormat:@"Thank you for shopping at Acme.com Your total today is $%ld Please select your payment method: Paypal, Stripe, or Amazon, ApplePay", price];
            
            NSInteger paymentMethod;
            paymentMethod = [inputHandler getPaymentMethod:paymentPrompt];
            
            switch (paymentMethod)
            {
                case 1:
                    paymentGateway.delegate = paypal;
                    isProcessedPayment = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 2:
                    paymentGateway.delegate = stripe;
                    isProcessedPayment = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 3:
                    paymentGateway.delegate = amazon;
                    isProcessedPayment = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                case 4:
                    paymentGateway.delegate = applePay;
                    isProcessedPayment = [paymentGateway.delegate processPaymentAmount: price];
                    break;
                    
            }

        }
            
        
        
    }
    return 0;
}
