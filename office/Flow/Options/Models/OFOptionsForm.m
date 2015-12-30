//
//  OFOptionsForm.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFOptionsForm.h"

@implementation OFOptionsForm 

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
