//
//  NoteManagedObject+CoreDataProperties.m
//  PersistenceLayer
//
//  Created by tonyguan on 2016/11/3.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "NoteManagedObject+CoreDataProperties.h"

@implementation NoteManagedObject (CoreDataProperties)

+ (NSFetchRequest<NoteManagedObject *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Note"];
}

@dynamic content;
@dynamic date;

@end
