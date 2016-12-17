//
//  RedditAPITests.m
//  Reddit
//
//  Created by Vladimír Zdražil on 12/12/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RedditAPI.h"
@interface RedditAPITests : XCTestCase

@end

@implementation RedditAPITests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testJSONUrlIsForCorrectSubreddit {
    NSArray* subreddits = @[@"movies", @"programming", @"coding"];
    NSMutableArray* subredditsJSON = [[NSMutableArray alloc] init];
    
    for (NSString* subreddit in subreddits) {
        NSDictionary* subredditData = [RedditAPI getJSONForSubreddit:subreddit];
        NSArray* redditChildren = [subredditData valueForKeyPath:@"data.children"];
        NSDictionary* redditFirstChidren = redditChildren[0];
        NSString* subredditName = [redditFirstChidren valueForKeyPath:@"data.subreddit"];
        [subredditsJSON addObject:subredditName];
    }
    
    XCTAssertEqualObjects(subreddits, subredditsJSON);
}

@end
