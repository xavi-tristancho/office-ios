//
//  OFArticleForm.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFArticle.h"

#import <FXForms/FXForms.h>

@interface OFArticleForm : OFArticle <FXForm>

- (instancetype)initWithArticle:(OFArticle *)article;

@end
