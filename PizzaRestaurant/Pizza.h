//
//  Pizza.h
//  Pizza
//
//  Created by Rushan on 2017-05-04.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pizza : NSObject

typedef NS_ENUM(NSInteger, PizzaSize){
    PizzaSizeSmall,
    PizzaSizeMedium,
    PizzaSizeLarge
};

@property (nonatomic, readonly, strong) NSArray *toppings;
@property (nonatomic, readonly, assign) PizzaSize size;

-(instancetype)initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings;


@end
