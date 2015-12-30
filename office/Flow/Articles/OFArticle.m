//
//  OFArticle.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFArticle.h"

@implementation OFArticle

- (NSDictionary *)toJSON
{
    return @{
             @"id" : _ID,
             @"reference" : _reference,
             @"name" : _name,
             @"family" : _family,
             @"provider" : _provider,
             @"purchase_price" : _purchasePrice,
             @"cost_price" : _costPrice,
             @"sell_price" : _sellPrice,
             @"quantity" : _quantity,
             };
}

@end
