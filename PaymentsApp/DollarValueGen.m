//
//  DollarValueGen.m
//  PaymentsApp
//
//  Created by Tim Beals on 2016-11-04.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "DollarValueGen.h"

@interface DollarValueGen ()



@end

@implementation DollarValueGen

-(NSInteger)generatePrice {
    int lowerBound = 100;
    int upperBound = 1000;
    int rndValue = lowerBound + (arc4random() % (upperBound - lowerBound));
    
    return rndValue;
}

@end
