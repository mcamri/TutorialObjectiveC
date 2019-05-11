//
//  Phone+CoreDataProperties.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import "Phone+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Phone (CoreDataProperties)

+ (NSFetchRequest<Phone *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *number;
@property (nullable, nonatomic, retain) Person *belongsTo;

@end

NS_ASSUME_NONNULL_END
