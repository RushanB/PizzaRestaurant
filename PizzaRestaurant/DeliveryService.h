//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Rushan on 2017-05-05.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryCar.h"

@interface DeliveryService : NSObject

@property (nonatomic) NSMutableArray *pizzasDelivered;
@property (nonatomic) DeliveryCar *aCar;

-(void)deliverPizza:(Pizza *)pizza;

@end
