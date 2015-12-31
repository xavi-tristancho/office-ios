//
//  OFInventoryService.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 31/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFInventoryService.h"

@implementation OFInventoryService

- (NSURLSessionDataTask *)getInventory:(void (^)(OFInventoryForm *inventory))completion
{
    return [self GET:@"articles/inventory"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                OFInventoryForm *inventory = [OFInventoryForm objectFromDictionary:[responseObject objectForKey:@"data"]];
                
                if (completion) completion(inventory);
            }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                [super showErrorMessage];
            }];
}

@end
