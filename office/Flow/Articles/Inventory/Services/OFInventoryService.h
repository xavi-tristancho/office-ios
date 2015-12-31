//
//  OFInventoryService.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 31/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFAPIClient.h"
#import "OFInventoryForm.h"

@interface OFInventoryService : OFAPIClient

- (NSURLSessionDataTask *)getInventory:(void (^)(OFInventoryForm *inventory))completion;

@end
