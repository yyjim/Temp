//
//  Employee.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithJSONDictionary:(NSDictionary *)employeeDict
{
    self = [super init];
    if (self) {
        if (employeeDict != nil) {
            self.firstName       = employeeDict[@"firstName"];
            self.lastName        = employeeDict[@"lastName"];
            self.bio             = employeeDict[@"bio"];
            self.title           = employeeDict[@"title"];
            self.idNumber        = employeeDict[@"id"];
            self.avatarStringURL = employeeDict[@"avatar"];
        }
    }
    return self;
}

@end
