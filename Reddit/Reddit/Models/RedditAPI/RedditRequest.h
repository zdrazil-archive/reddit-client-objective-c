//
//  RedditRequest.h
//  Reddit
//
//  Created by Vladimír Zdražil on 30/11/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RedditRequest : NSObject

@property NSArray* subredditPosts;

- (NSArray *)getPostsFromSubreddit:(NSString *)subreddit numberOfPosts:(int)numberOfPosts;
- (NSString *)getTitlePost:(int)postPosition;
- (NSString *)getBodyPost:(int)postPosition;

@end
