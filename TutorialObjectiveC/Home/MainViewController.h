//
//  MainViewController.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 10/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

+ (NSString*)getString;

@end

NS_ASSUME_NONNULL_END
