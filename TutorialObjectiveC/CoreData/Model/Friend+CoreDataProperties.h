//
//  Friend+CoreDataProperties.h
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import "Friend+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Friend (CoreDataProperties)

+ (NSFetchRequest<Friend *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, retain) Friend *belongsTo;

@end

NS_ASSUME_NONNULL_END
