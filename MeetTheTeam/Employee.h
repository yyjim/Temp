//
//  Employee.h
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Employee : NSObject

@property (copy, nonatomic) NSString *avatarStringURL;
@property (copy, nonatomic) UIImage  *avatarImage;
@property (copy, nonatomic) NSString *bio;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSNumber *idNumber;
@property (copy, nonatomic) NSString *title;

- (instancetype)initWithJSONDictionary:(NSDictionary *)employeeDict;

@end
