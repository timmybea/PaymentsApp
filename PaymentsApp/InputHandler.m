//
//  InputHandler.m
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "InputHandler.h"

@interface InputHandler ()

@property (nonatomic) NSDictionary *commands;

@end


@implementation InputHandler

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _commands = @{@"paypal":@1, @"stripe":@2, @"amazon":@3, @"applepay":@4};
    }
    return self;
}

- (NSString*)inputForPrompt:(NSString *)promptString
{
    NSLog(@"%@", promptString);
    NSLog(@"> ");
    char varWord[255];
    fgets (varWord, 255, stdin);
    NSString *userInput = [NSString stringWithCString:varWord encoding:NSUTF8StringEncoding];
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"Input was %@", userInput);
    return userInput;
}

- (NSInteger)commandNumber:(NSString*)command
{
    NSString *userInput = [command lowercaseString];
    if ([userInput isEqualToString:@"paypal"] || [userInput isEqualToString:@"stripe"] || [userInput isEqualToString:@"amazon"] || [userInput isEqualToString:@"applepay"])
    {
        return [[self.commands objectForKey:userInput] integerValue];
    }
    else
    {
        return [self commandNumber:[self inputForPrompt:@"Invalid payment method. Please try again"]];
    }
}

- (NSInteger)getPaymentMethod:(NSString *)promptString
{
    NSInteger payment;
    payment =  [self commandNumber:[self inputForPrompt:promptString]];
    return payment;
}

@end
