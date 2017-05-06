//
//  Manager.h
//  PizzaRestaurant
//
//  Created by Rushan on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "DeliveryService.h"
#import "SecondManager.h"

@interface Manager : NSObject<KitchenDelegate>

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

-(void)kitchenDidMakePizza:(Pizza *)pizza;

@end
