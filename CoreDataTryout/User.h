//
//  User.h
//  CoreDataTryout
//
//  Created by Lee on 1/26/15.
//  Copyright (c) 2015 Scau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * weight;

@end
