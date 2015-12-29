//
//  OFCustomersService.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFCustomersService.h"
#import "OFCustomer.h"

@implementation OFCustomersService

- (NSURLSessionDataTask *)getAllWithCompletion:(void (^)(NSArray *customers))completion
{
    return [self GET:@"customers"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSArray *customers = [OFCustomer objectFromDictionary:[responseObject objectForKey:@"data"]];
        
        if (completion) completion(customers);
    }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
                 
    }];
}

@end
