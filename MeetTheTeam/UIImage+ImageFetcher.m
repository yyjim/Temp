//
//  UIImage+ImageFetcher.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "UIImage+ImageFetcher.h"

@implementation UIImage (ImageFetcher)

+ (void)fetchImageWith:(NSString *)urlString completionHandler:(void (^)(UIImage *image))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        if (image != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(image);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
    });
}

@end
