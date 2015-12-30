//
//  OFShowArticlesViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFShowArticlesViewController.h"
#import "OFArticlesService.h"

@interface OFShowArticlesViewController ()

@end

@implementation OFShowArticlesViewController

- (instancetype)initWithArticle:(OFArticle *)article
{
    self = [super init];

    if (self)
    {
        self.formController.form = [[OFArticleForm alloc] initWithArticle:article];
    }
    
    return self;
}

- (void)didTapSaveButton
{
    OFArticlesService *articleService = [OFArticlesService new];
    [articleService save:self.formController.form
          withCompletion:^{
              
          }];
}

@end
