//
//  UIImage+ImageFetcher.h
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageFetcher)

+ (void)fetchImageWith:(NSString *)urlString
     completionHandler:(void (^)(UIImage *image))completion;


@end
