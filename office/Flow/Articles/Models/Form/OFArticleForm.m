//
//  OFArticleForm.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFArticleForm.h"

@implementation OFArticleForm 

- (instancetype)initWithArticle:(OFArticle *)article
{
    self = [super init];

    if (self)
    {
        self.ID            = article.ID;
        self.reference     = article.reference;
        self.name          = article.name;
        self.family        = article.family;
        self.provider      = article.provider;
        self.purchasePrice = article.purchasePrice;
        self.costPrice     = article.costPrice;
        self.sellPrice     = article.sellPrice;
        self.quantity      = article.quantity;
    }
    
    return self;
}

- (NSArray *)excludedFields
{
    return @[@"ID"];
}

- (NSArray *)extraFields
{
    return @[
             
             //this field doesn't correspond to any property of the form
             //it's just an action button. the action will be called on first
             //object in the responder chain that implements the submitForm
             
             @{FXFormFieldTitle : NSLocalizedString(@"Save", @""),
               FXFormFieldHeader: @"",
               FXFormFieldAction: @"didTapSaveButton"},
             
             ];
}

@end
