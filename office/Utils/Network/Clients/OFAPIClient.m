//
//  OFClient.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"

static NSString *HOST_URL = @"http://localhost:8080/";
static NSString *API_URL  = @"api/";

@implementation OFAPIClient

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", HOST_URL, API_URL]]];

    if (self)
    {
        
    }
    
    return self;
}

@end
