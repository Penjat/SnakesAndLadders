//
//  GameManager.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager
-(BOOL)playing{
    
    NSLog(@"Welcome to snakes and ladders");
    
    Player *player1 = [[Player alloc] init];
    MoveManager *moveManager = [[MoveManager alloc] init];
    enum GameState gameState = PLAYING;
    while(true){
        
        NSString *input = [InputManager getPlayerInput];
        
        
        
        if(gameState == SETUP){
            
        }else if(gameState == PLAYING){
            if([input isEqualToString:@"roll"] || [input isEqualToString:@"r"] ){
                [player1 roll];
                [moveManager checkItle:player1];
                if([moveManager checkGameOver:player1]){
                    NSLog(@"you win!!!");
                    
                    return NO;
                }
            }
        }
        
    }
}
-(void)playLogic:(NSString*)input{
    
}
@end
