//
//  OFClient.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"

NSString *const apiURL = @"http://52.48.158.208/office-backend/public/api/";

@implementation OFAPIClient

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:apiURL]];

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
