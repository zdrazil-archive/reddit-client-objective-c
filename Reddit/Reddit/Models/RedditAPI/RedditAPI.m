//
//  RedditAPI.m
//  Reddit
//
//  Created by Vladimír Zdražil on 30/11/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import "RedditAPI.h"

@implementation RedditAPI

+ (NSDictionary *)getJSONForSubreddit:(NSString *)subreddit {
    NSString* baseURL = @"https://www.reddit.com/r/";
    NSString* endURL = @"/.json";
    NSString* finalURL = [NSString stringWithFormat:@"%@%@%@", baseURL, subreddit, endURL];
    NSData* data = [NSData dataWithContentsOfURL:
                    [NSURL URLWithString:finalURL]];
   
    NSError* error;
    
    NSDictionary* subredditData = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
   
    return subredditData;
}

@end
