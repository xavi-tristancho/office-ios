//
//  OFArticlesService.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"
#import "OFArticle.h"

@interface OFArticlesService : OFAPIClient

- (NSURLSessionDataTask *)getAllWithCompletion:(void (^)(NSArray *customers))completion;

- (NSURLSessionDataTask *)find:(OFArticle *)article
                withCompletion:(void (^)( OFArticle *article))completion;

- (NSURLSessionDataTask *)save:(OFArticle *)article
                withCompletion:(void (^)())completion;

@end
