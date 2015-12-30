//
//  OFArticle.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OFArticle : NSObject

@property (strong, nonatomic) NSNumber *ID;
@property (strong, nonatomic) NSString *reference;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *family;
@property (strong, nonatomic) NSString *provider;
@property (strong, nonatomic) NSNumber *purchasePrice;
@property (strong, nonatomic) NSNumber *costPrice;
@property (strong, nonatomic) NSNumber *sellPrice;
@property (strong, nonatomic) NSNumber *quantity;

- (NSDictionary *)toJSON;

@end
