//
//  OFArticlesService.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFArticlesService.h"
#import "OFArticle.h"

@implementation OFArticlesService

- (NSURLSessionDataTask *)getAllWithCompletion:(void (^)(NSArray *customers))completion
{
    return [self GET:@"customers"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                NSArray *customers = [OFArticle objectFromDictionary:[responseObject objectForKey:@"data"]];
                
                if (completion) completion(customers);
            }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                
            }];
}

@end
