//
//  OFCustomer.h
//  office
//
//  Created by Xavier Tristancho Bordoy on 28/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OFCustomer : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *secondName;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSString *mobilePhone;
@property (strong, nonatomic) NSString *dni;
@property (strong, nonatomic) NSString *email;

- (NSString *)getFullName;

@end
