//
//  OFClient.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "OCMapper.h"
#import <TWMessageBarManager/TWMessageBarManager.h>

@interface OFAPIClient : AFHTTPSessionManager

- (void)showErrorMessage;

@end
