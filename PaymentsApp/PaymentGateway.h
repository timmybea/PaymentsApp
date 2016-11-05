//
//  PaymentGateway.h
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PaymentDelegate

@property (nonatomic) BOOL canProcessPayment;

- (BOOL)processPaymentAmount:(NSInteger)price;

@end


@interface PaymentGateway : NSObject

@property (nonatomic, strong) id <PaymentDelegate> delegate;

@end
