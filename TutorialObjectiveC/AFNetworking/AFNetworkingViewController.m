//
//  AFNetworkingViewController.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 10/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import "AFNetworkingViewController.h"


@interface MyClass:NSObject
@property (nonatomic, strong) void(^block)(void);
@end

@implementation MyClass

- (void)foobar {
    __weak MyClass *weakSelf = self;
    self.block = ^ {
        MyClass * strongSelf = weakSelf;
        [strongSelf foobar];
    };
    
}

@end

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void) loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100,100, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = UIColor.greenColor;
    view.translatesAutoresizingMaskIntoConstraints = false;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


@end
