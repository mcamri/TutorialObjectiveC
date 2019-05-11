//
//  Phone+CoreDataProperties.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 11/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//
//

#import "Phone+CoreDataProperties.h"

@implementation Phone (CoreDataProperties)

+ (NSFetchRequest<Phone *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Phone"];
}

@dynamic number;
@dynamic belongsTo;

@end
