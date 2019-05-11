//
//  Person+CoreDataProperties.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, retain) Phone *hasPhone;
@property (nullable, nonatomic, retain) NSSet<Friend *> *hasFriends;

@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addHasFriendsObject:(Friend *)value;
- (void)removeHasFriendsObject:(Friend *)value;
- (void)addHasFriends:(NSSet<Friend *> *)values;
- (void)removeHasFriends:(NSSet<Friend *> *)values;

@end

NS_ASSUME_NONNULL_END
