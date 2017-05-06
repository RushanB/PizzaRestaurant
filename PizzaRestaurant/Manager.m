//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Rushan on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"

@implementation Manager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    if([toppings containsObject:@"anchovies"]){
        NSLog(@"Sorry we don't serve anchovies");
        return NO;
    }else{
        return YES;
    }
}
-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    return NO;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza{
    SecondManager *makes = [[SecondManager alloc] init];
    [makes kitchenDidMakePizza:pizza];
}

@end
