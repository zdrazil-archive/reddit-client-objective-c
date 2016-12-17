//
//  RedditRequest.m
//  Reddit
//
//  Created by Vladimír Zdražil on 30/11/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import "RedditRequest.h"
#import "RedditAPI.h"
#import "RedditPost.h"

@interface RedditRequest ()

@property NSDictionary* jsonData;
@property NSArray* childrenArray;

@end

@implementation RedditRequest

- (NSArray *)getPostsFromSubreddit:(NSString *)subreddit numberOfPosts:(int)numberOfPosts {
    [self setJsonData:[RedditAPI getJSONForSubreddit:subreddit]];
    [self setChildrenArray:[[self jsonData] valueForKeyPath:@"data.children"]];
    NSMutableArray* postsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < numberOfPosts; i++) {
        RedditPost* redditPost = [[RedditPost alloc] init];
        
        NSString* titlePost = [self getTitlePost:i];
        NSString* bodyPost = [self getBodyPost:i];
        
        [redditPost setPostTitle:titlePost];
        [redditPost setPostBody:bodyPost];
        
        [postsArray addObject:redditPost];
    }
    
    [self setSubredditPosts:postsArray];
    return postsArray;
}

- (NSString *)getTitlePost:(int)postPosition {
    NSString* titlePost = [[self childrenArray][postPosition] valueForKeyPath:@"data.title"];
    return titlePost;
}

- (NSString *)getBodyPost:(int)postPosition {
    NSString* bodyPost = [[self childrenArray][postPosition] valueForKeyPath:@"data.selftext"];
    return bodyPost;
}

@end
