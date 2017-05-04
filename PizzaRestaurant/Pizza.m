//
//  Pizza.m
//  Pizza
//
//  Created by Rushan on 2017-05-04.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza


-(instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}



@end
