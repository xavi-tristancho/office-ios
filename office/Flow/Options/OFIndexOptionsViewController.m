//
//  OFindexOptionsViewController.m
//  office
//
//  Created by Xavier Tristancho Bordoy on 30/12/15.
//  Copyright © 2015 Xavier Tristancho Bordoy. All rights reserved.
//

#import "OFIndexOptionsViewController.h"
#import "OFOptionsForm.h"

#import "APLFontAwesome.h"

@interface OFIndexOptionsViewController ()

@end

@implementation OFIndexOptionsViewController

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        UIImage *icon = [APLFontAwesome imageFromIcon:@"\uf013"
                                                 size:20.0f
                                                color:[UIColor blackColor]
                                                frame:CGRectMake(0, 0, 20, 20)];
        
        [[self tabBarItem] setImage:icon];
        [[self tabBarItem] setTitle:NSLocalizedString(@"Options", @"")];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *protocol = [defaults objectForKey:@"api_protocol"];
        NSString *host = [defaults objectForKey:@"api_host"];
        NSNumber *port = [defaults objectForKey:@"api_port"];
        NSString *api  = [defaults objectForKey:@"api_prefix"];
        
        OFOptionsForm *optionsForm = [[OFOptionsForm alloc] init];
        
        if (protocol)
        {
            [optionsForm setProtocol:protocol];
        }
        
        if (host)
        {
            [optionsForm setHost:host];
        }
        
        if (port)
        {
            [optionsForm setPort:port];
        }
        
        if (api)
        {
            [optionsForm setApi:api];
        }
        
        self.formController.form = optionsForm;
    }
    
    return self;
}

- (void)didTapSaveButton
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    OFOptionsForm *optionsForm = (OFOptionsForm *)self.formController.form;

    [defaults setObject:[optionsForm protocol] forKey:@"api_protocol"];
    [defaults setObject:[optionsForm host] forKey:@"api_host"];
    [defaults setObject:[optionsForm port] forKey:@"api_port"];
    [defaults setObject:[optionsForm api]  forKey:@"api_prefix"];
    
    [defaults synchronize];
}

@end
