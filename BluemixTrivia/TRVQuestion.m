//
//  TRVQuestion.m
//  BluemixTrivia
//
//  Created by Avi Eshel on 3/8/15.
//  Copyright (c) 2015 Avi Eshel. All rights reserved.
//

#import "TRVQuestion.h"

@interface TRVQuestion()

@property (nonatomic, copy) NSString *question; // Question text

@property (nonatomic, copy) NSArray *answers; // Answers array to allow multiple choice, each answer should be a string

@property (nonatomic) int answer; // Holds the correct answer's index

@end

@implementation TRVQuestion

- (instancetype) initWithAnswersArray:(NSString *)questionText :(NSArray *)answersArray :(int)correctAnswer
{
    self = [super init];
    if (self)
    {
        self.question = questionText;
        self.answers = answersArray;
        self.answer = correctAnswer;
        
    }
    return self;
}

- (instancetype) init
{
    NSString *question = @"What is the secret of everything?";
    NSArray *answers = @[@"40", @"41", @"42", @"43"];
    int answer = 2;
    
    return [self initWithAnswersArray:question :answers :answer];
}


@end
