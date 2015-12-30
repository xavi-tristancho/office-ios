//
//  OFShowArticlesViewController.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <FXForms/FXForms.h>
#import "OFArticleForm.h"

@interface OFShowArticlesViewController : FXFormViewController

- (instancetype)initWithArticle:(OFArticle *)article;

@end
