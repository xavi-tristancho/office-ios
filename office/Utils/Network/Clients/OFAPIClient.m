//
//  OFClient.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"

@implementation OFAPIClient

- (instancetype)init
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *protocol = [defaults objectForKey:@"api_protocol"];
    NSString *host     = [defaults objectForKey:@"api_host"];
    NSNumber *port     = [defaults objectForKey:@"api_port"];
    NSString *api      = [defaults objectForKey:@"api_prefix"];
    
    NSString *baseUrl = [NSString stringWithFormat:@"%@://%@:%@/%@", protocol, host, [port stringValue], api];
    
    self = [super initWithBaseURL:[NSURL URLWithString:baseUrl]];

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
