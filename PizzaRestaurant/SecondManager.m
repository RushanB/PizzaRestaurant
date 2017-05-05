//
//  SecondManager.m
//  PizzaRestaurant
//
//  Created by Rushan on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "SecondManager.h"

@implementation SecondManager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    return YES;
}

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    return YES;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza{
    NSLog(@"Good job!");
}

@end
