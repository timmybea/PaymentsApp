//
//  InputHandler.h
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputHandler : NSObject

//- (NSString*) inputForPrompt:(NSString *) promptString;
- (NSInteger) getPaymentMethod: (NSString *) promptString;

@end
