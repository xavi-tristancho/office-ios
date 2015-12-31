//
//  OFInventoryForm.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 31/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms/FXForms.h>

@interface OFInventoryForm : NSObject <FXForm>

@property (strong, nonatomic, readonly) NSNumber *total;

@end
