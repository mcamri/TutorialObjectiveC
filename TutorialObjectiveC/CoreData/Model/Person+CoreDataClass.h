//
//  Person+CoreDataClass.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend, Phone;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Person+CoreDataProperties.h"
