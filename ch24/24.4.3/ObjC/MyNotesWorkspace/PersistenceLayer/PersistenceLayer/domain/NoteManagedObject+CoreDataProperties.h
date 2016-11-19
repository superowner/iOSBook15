//
//  NoteManagedObject+CoreDataProperties.h
//  PersistenceLayer
//
//  Created by tonyguan on 2016/11/3.
//  Copyright © 2016年 关东升. All rights reserved.
//

#import "NoteManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NoteManagedObject (CoreDataProperties)

+ (NSFetchRequest<NoteManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSDate *date;

@end

NS_ASSUME_NONNULL_END
