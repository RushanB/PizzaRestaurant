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
        SecondManager *secondManager = [SecondManager new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"Would you like to speak to a Manager?(yes or no):");
            NSString *choice = [InputManager input];
            
            
            if([choice isEqualToString:@"yes"]){
                NSLog(@"Would you like to speak to Bob or Rob?:");
                NSString *manager = [InputManager input];
                if([manager isEqualToString:@"Bob"]){
                   restaurantKitchen.kitchenDelegate = newManager;
                }else if([manager isEqualToString:@"Rob"]){
                    restaurantKitchen.kitchenDelegate = secondManager;
                }

            }else if([choice isEqualToString:@"no"]){
                NSLog(@"Okay have a nice day.");
            }
        
        
            
            NSString *inputString;
            NSLog(@"Please enter the size of the Pizza followed by the Toppings: %@", inputString);
            
            inputString = [InputManager input];
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            NSLog(@"Reciept %@", commandWords);
            
            PizzaSize size = parseSize(commandWords[0]);
            
            NSArray<NSString*> *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count-1)];
            
            Pizza* newPizza = [restaurantKitchen makePizzaWithSize:size andToppings:toppings];
            NSLog(@"Pizza %@ with size: %ld and toppings:%@", newPizza, size, toppings);
        }
    }
    return 0;
}

