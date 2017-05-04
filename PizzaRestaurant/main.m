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
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
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

