//
//  OFCustomer.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFCustomer.h"

@implementation OFCustomer

- (NSString *)getFullName
{
    return [NSString stringWithFormat:@"%@ %@ %@", _name, _firstName, _secondName];
}

@end
