//
//  TRVQuestion.h
//  BluemixTrivia
//
//  Created by Avi Eshel on 3/8/15.
//  Copyright (c) 2015 Avi Eshel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRVQuestion : NSObject

@property (nonatomic, copy) NSString *question; // Question text

@property (nonatomic, copy) NSArray *answers; // Answers array to allow multiple choice, each answer should be a string

@property (nonatomic) int answer; // Holds the correct answer's index


@end
