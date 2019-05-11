//
//  CoreDataManager.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

+ (CoreDataManager*) shared;

- (void)saveContext;

- (NSManagedObjectContext *) managedObjectContext;

@end

NS_ASSUME_NONNULL_END
