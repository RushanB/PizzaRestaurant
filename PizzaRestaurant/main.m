//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pizza.h"
#import "Kitchen.h"
#import "Manager.h"
#import "SecondManager.h"
#import "InputManager.h"
#import "DeliveryCar.h"
#import "DeliveryService.h"

PizzaSize parseSize(NSString* sizeStr){
    if ([sizeStr isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    }
    {
        if ([sizeStr isEqualToString:@"medium"])
            return PizzaSizeMedium;
    }
    {
        if ([sizeStr isEqualToString:@"large"]) {
            return PizzaSizeLarge;
        }
        return PizzaSizeMedium;
  }
}
 
int main(int argc, const char * argv[]){

    @autoreleasepool {
        
        NSLog(@"Welcome to this Pizza Restaurant!");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Manager *newManager = [Manager new];
        SecondManager *newSecondManager = [SecondManager new];
        DeliveryService *serviceDelivery = [[DeliveryService alloc] init];
        newSecondManager.delivery = serviceDelivery;
        
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"Would you like to speak to a Manager?bob or rob");
            InputManager *input = [InputManager new];
            NSArray *commandWords = [[input getInput] componentsSeparatedByString:@" "];
            
            
            if([commandWords[0]isEqualToString:@"bob"]){
                    restaurantKitchen.kitchenDelegate = newManager;
            }else if([commandWords[0]isEqualToString:@"rob"]){
                restaurantKitchen.kitchenDelegate = newSecondManager;
            }else{
                NSLog(@"Okay please continue with your order.");
            }
        
        
            NSLog(@"Please enter the size of the Pizza followed by the Toppings");
            NSArray *pizza = [[input getInput] componentsSeparatedByString:@" "];
            NSMutableArray *toppings = [[NSMutableArray alloc] initWithArray:pizza];
            PizzaSize size = parseSize(commandWords[0]);
            
            [toppings removeObjectAtIndex:0];
            Pizza* newPizza = [restaurantKitchen makePizzaWithSize:size andToppings:toppings];
            
            if(newPizza){
                NSLog(@"Your Pizza %@ with size: %ld and toppings: %@ is ready.",newPizza, size, toppings);
            }else{
                NSLog(@"No Anchovies");
            }
            break;
            
            //NSLog(@"Your toppings are %@", commandWords);
            
            
            //NSArray<NSString*> *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count-1)];
    
        }
    }
    return 0;
}

