//
//  MainViewController.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 10/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import "MainViewController.h"

@interface SubClassViewController : MainViewController

@end

@implementation SubClassViewController


@end

@interface MainViewController ()

@property (nonatomic, retain) UITableView* tableView;
@property (atomic, retain) NSMutableArray* dataSource;
@property NSString* str;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray arrayWithArray:@[
                        @"Thread",
                        @"AFNetworking",
                        @"Core Data"
                        ]];
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
    [self.view addSubview:self.tableView];
    
    [_tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"edit" style:UIBarButtonItemStylePlain target:self
                                                                            action:@selector(editTableView)];
}

- (void) editTableView {
//    self.tableView.editing
    [self.tableView setEditing:true animated:true];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    [self performSegueWithIdentifier:_dataSource[indexPath.row] sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSInteger from = sourceIndexPath.row;
    NSInteger to = destinationIndexPath.row;
    NSString* data = _dataSource[from];
    self.dataSource[from] = self.dataSource[to];
    self.dataSource[to] = data;
    for (int i = 0; i < _dataSource.count; i++) {
        NSLog(@"%@",_dataSource[i]);
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    

    
}

@end
