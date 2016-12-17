//
//  RedditAPI.h
//  Reddit
//
//  Created by Vladimír Zdražil on 30/11/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditAPI : NSObject

+ (NSDictionary *)getJSONForSubreddit:(NSString *)subreddit;

@end
