//
//  OFCustomersService.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"

@interface OFCustomersService : OFAPIClient

- (NSURLSessionDataTask *)getAllWithCompletion:(void (^)(NSArray *customers))completion;

@end
