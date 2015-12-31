//
//  OFInventoryForm.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 31/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFInventoryForm.h"

@implementation OFInventoryForm

- (NSArray *)fields
{
    return @[
             @{FXFormFieldKey: @"total", FXFormFieldType: FXFormFieldTypeLabel},
             ];
}

@end
