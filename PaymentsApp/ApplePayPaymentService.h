//
//  ApplePayPaymentService.h
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

@interface ApplePayPaymentService : NSObject <PaymentDelegate>

@property (nonatomic) BOOL canProcessPayment;

@end
