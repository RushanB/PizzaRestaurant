//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Rushan on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pizzasDelivered = [[NSMutableArray alloc] init];
        _aCar = [[DeliveryCar alloc] init];
    }
    return self;
}

-(void) deliverPizza:(Pizza *)pizza{
    [self.pizzasDelivered addObject:pizza];
    [self.aCar deliverPizza:pizza];
}

@end
