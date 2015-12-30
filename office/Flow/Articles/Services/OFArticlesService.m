//
//  OFArticlesService.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFArticlesService.h"

@implementation OFArticlesService

- (NSURLSessionDataTask *)getAllWithCompletion:(void (^)(NSArray *articles))completion
{
    return [self GET:@"articles"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                NSArray *articles = [OFArticle objectFromDictionary:[responseObject objectForKey:@"data"]];
                
                if (completion) completion(articles);
            }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                [super showErrorMessage];
            }];
}

- (NSURLSessionDataTask *)find:(OFArticle *)article
                withCompletion:(void (^)( OFArticle *article))completion
{
    NSString *uri = [NSString stringWithFormat:@"articles/%@", [article ID]];
    
    return [self GET:uri
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                OFArticle *article = [OFArticle objectFromDictionary:[responseObject objectForKey:@"data"]];
                
                if (completion) completion(article);
            }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                [super showErrorMessage];
            }];
}

- (NSURLSessionDataTask *)save:(OFArticle *)article
                withCompletion:(void (^)())completion
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *uri = [NSString stringWithFormat:@"articles/%@", [article ID]];
    
    return [self PATCH:uri
            parameters:[article toJSON]
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Success!", @"")
                                                       description:NSLocalizedString(@"The article has been saved", @"")
                                                              type:TWMessageBarMessageTypeSuccess
                                                          duration:3.0f
                                                   displayLocation:TWMessageBarDisplayLocationBottom
                                                          callback:nil];
        
        if (completion) completion();
    }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        [super showErrorMessage];
    }];
}

@end
