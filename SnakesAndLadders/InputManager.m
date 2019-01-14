//
//  InputManager.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "InputManager.h"

@implementation InputManager
+(NSString*)getPlayerInput{
    char str[100];
    fgets (str, 100, stdin);
    
    NSString *inputString = [[NSString alloc] initWithUTF8String:str];
    
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return inputString;
}
@end
