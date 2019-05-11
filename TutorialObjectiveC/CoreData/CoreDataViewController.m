//
//  CoreDataViewController.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 10/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import "CoreDataViewController.h"
#import <CoreData/CoreData.h>
#import "Person+CoreDataClass.h"
#import "CoreDataManager.h"

@interface CoreDataViewController ()
@property (nonatomic, retain) UITableView* tableView;
@property (atomic, retain) NSMutableArray* dataSource;

@end

@implementation CoreDataViewController
int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeTableView];
    [self initializeButton];
}

- (void) initializeDataSource {
    self.dataSource = [NSMutableArray arrayWithArray:[self getPersons]];
}

- (void) initializeTableView {
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
    [self.view addSubview:self.tableView];
    
    [_tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void) initializeButton {
    UIBarButtonItem* add = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self
                                                           action:@selector(addPressed)];
    UIBarButtonItem* delete = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(deletePressed)];
    UIBarButtonItem* edit = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self
                                                            action:@selector(editPressed)];
    self.navigationItem.rightBarButtonItems = @[add, delete, edit];
}

- (void) addPressed {
    [self saveObject];
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:[self getPersons]];
    count++;
    [self.tableView reloadData];
}

- (void) saveObject {
    NSManagedObjectContext *context = [self managedObjectContext];
    Person *person = [[Person alloc] initWithContext:context];
    person.name = [NSString stringWithFormat:@"Name %d", count];
    person.age = count;
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

- (NSArray*) getPersons {
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    NSError *error = nil;
    NSArray* persons = [[managedObjectContext executeFetchRequest:fetchRequest error:&error] mutableCopy];
    if (error) {
        NSLog(@"Can't retrieve! %@ %@", error, [error localizedDescription]);
        return @[];
    }else {
        return persons;
    }
}

- (void) deletePressed {
    [self deleteFirst];
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:[self getPersons]];
    [self.tableView reloadData];
}

- (void) deleteFirst {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject * person = [_dataSource firstObject];
    if(person){
        [context deleteObject:person];
    }
}

- (void) editPressed {
    [self editFirst];
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:[self getPersons]];
    [self.tableView reloadData];
}

- (void) editFirst {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject * person = [_dataSource firstObject];
    if(person){
        [person setValue:[NSString stringWithFormat:@"Edit %d", count] forKey:@"name"];
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Save Edited! %@ %@", error, [error localizedDescription]);
        }
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject* person = _dataSource[indexPath.row];
    cell.textLabel.text = [person valueForKey:@"name"];
    return cell;
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    [self performSegueWithIdentifier:_dataSource[indexPath.row] sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext *context = [CoreDataManager.shared managedObjectContext];
    return context;
}


@end
