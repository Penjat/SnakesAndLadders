//
//  main.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputManager.h"
#import "Player.h"
#import "MoveManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Welcome to snakes and ladders");
        
        Player *player1 = [[Player alloc] init];
        MoveManager *moveManager = [[MoveManager alloc] init];
        
        
        
        while(true){
        
            NSString *input = [InputManager getPlayerInput];
            
            if([input isEqualToString:@"roll"] || [input isEqualToString:@"r"] ){
                [player1 roll];
                [moveManager checkItle:player1];
                if([moveManager checkGameOver:player1]){
                    NSLog(@"you win!!!");
                    return 0;
                }
            }
        }
    }
    return 0;
}
