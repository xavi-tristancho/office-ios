//
//  OFClient.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"

//static NSString *HOST_URL = @"http://localhost:8888/";
static NSString *HOST_URL = @"http://192.168.1.5:8080/backend/public/";
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

- (void)showErrorMessage
{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Fail!", @"")
                                                   description:NSLocalizedString(@"Oops, something went wrong", @"")
                                                          type:TWMessageBarMessageTypeError
                                                      duration:3.0f
                                               displayLocation:TWMessageBarDisplayLocationBottom
                                                      callback:nil];
}

@end
