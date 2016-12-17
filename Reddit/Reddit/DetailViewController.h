//
//  DetailViewController.h
//  Reddit
//
//  Created by Vladimír Zdražil on 30/11/2016.
//  Copyright © 2016 Vladimír Zdražil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

