//
//  OFOptionsForm.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms/FXForms.h>

@interface OFOptionsForm : NSObject <FXForm>

@property (strong, nonatomic) NSString   *host;
@property (nonatomic)         NSUInteger *port;

@end
