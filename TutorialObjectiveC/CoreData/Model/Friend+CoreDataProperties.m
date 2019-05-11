//
//  Friend+CoreDataProperties.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import "Friend+CoreDataProperties.h"

@implementation Friend (CoreDataProperties)

+ (NSFetchRequest<Friend *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Friend"];
}

@dynamic name;
@dynamic age;
@dynamic belongsTo;

@end
