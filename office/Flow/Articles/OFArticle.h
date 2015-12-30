//
//  OFArticle.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OFArticle : NSObject

/*
 "id": 2,
 "reference": "00106-31",
 "name": "SIMON TRIPLE NORMAL",
 "family": "SIMON VARIOS",
 "provider": "SOCIAS Y ROSSELLO S.A.\r",
 "purchase_price": 2.27,
 "cost_price": 1.25,
 "sell_price": 2.27,
 "quantity": 0
 */

@property (strong, nonatomic) NSNumber *ID;
@property (strong, nonatomic) NSString *reference;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *family;
@property (strong, nonatomic) NSString *provider;
@property (strong, nonatomic) NSNumber *purchasePrice;
@property (strong, nonatomic) NSNumber *costPrice;
@property (strong, nonatomic) NSNumber *sellPrice;
@property (strong, nonatomic) NSNumber *quantity;

@end
