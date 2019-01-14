//
//  GameManager.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc]init];
    }
    return self;
}
-(BOOL)setUp:(NSString*)input{
    //sets up the number of players with names
    //returns yes if set up sucsessfully
    
    NSNumber *numberOfPlayers = @([input integerValue]);
    if([numberOfPlayers isLessThan:@1] || [numberOfPlayers isGreaterThanOrEqualTo:@9]){
        NSLog(@"please enter a value between 1 and 8");
        return  NO;
    }
    self.players = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[numberOfPlayers integerValue];i++){
        //create and name the players
        Player *player = [[Player alloc]init];
        NSLog(@"please enter a name for player %i",(i+1));
        NSString *nameInput = [InputManager getPlayerInput:YES];//case allowed for name
        
        //if name left blank
        if([nameInput isEqualToString:@""]){
            nameInput = [NSString stringWithFormat:@"Player %i",(i+1)];
            NSLog(@"defaulting to %@",nameInput);
        }
        //start at tile 1
        [player setCurTile:@1];
        [player setName:nameInput];
        //add to players array
        [self.players addObject:player];
        
    }
    NSString *whosPlaying = @"playing a game between ";
    
    for (Player *player in self.players) {
        whosPlaying = [whosPlaying stringByAppendingString:[player name]];
        
        whosPlaying = [whosPlaying stringByAppendingString:@" "];
        
    }
    NSLog(@"%@",whosPlaying);
    return YES;
}
-(BOOL)playing{
    
    NSLog(@"Welcome to snakes and ladders");
    
    
    MoveManager *moveManager = [[MoveManager alloc] init];
    enum GameState gameState = SETUP;
    NSUInteger curTurn = 0;
    
    while(true){
        
        
        
        
        
        if(gameState == SETUP){
            NSLog(@"please enter the number of players");
            NSString *input = [InputManager getPlayerInput:NO];
            
            
            if([self setUp:input]){
                //if set up sucsessfully, start playing
                //TODO print 'playing a game with:'
                gameState = PLAYING;
            }
        }else if(gameState == QUIT){
            NSLog(@"Do you want to quit(Q) , restart(R) , or return to the current game (any other key)");
            NSString *input = [InputManager getPlayerInput:NO];
            if([input isEqualToString:@"q"]){
                NSLog(@"goodbye.");
                return NO;
            }else if([input isEqualToString:@"r"]){
                NSLog(@"restarting game");
                [self.players removeAllObjects];
                gameState = SETUP;
                curTurn = 0;
            }else{
                
            }
            
        }else if(gameState == PLAYING){
            Player *curPlayer = self.players[curTurn];
            [self printCurScore];
            NSLog(@"----------------%@'s turn----------------",[curPlayer name]);
            
            
            
            NSString *input = [InputManager getPlayerInput:NO];
            if([input isEqualToString:@"quit"] || [input isEqualToString:@"restart"] ){
                gameState = QUIT;
            }else if([input isEqualToString:@"roll"] || [input isEqualToString:@"r"] ){
                [curPlayer roll];
                [moveManager checkItle:curPlayer];
                if([moveManager checkGameOver:curPlayer]){
                    NSLog(@"%@ wins!!!",curPlayer.name);
                    NSString *finalScore = @"";
                    for (Player *player in self.players) {
                        
                        //don't print out the winning players position
                        if(player != curPlayer){
                            finalScore = [finalScore stringByAppendingString:[player printPos:YES]];
                        }
                        
                    }
                    NSLog(@"%@",finalScore);
                    NSLog(@"Do you want to play again? (y/n)");
                    input = [InputManager getPlayerInput:NO];
                    if( [input isEqualToString:@"y"]){
                        //TODO put in reset
                        [self.players removeAllObjects];
                        gameState = SETUP;
                        curTurn = 0;
                    }else{
                        NSLog(@"Goodbye.");
                        return NO;
                    }
                    
                    
                }
                //find the next turn
                curTurn = [self nextTurn:curTurn];
            }
        }
        
    }
}
-(NSUInteger)nextTurn:(NSUInteger)curTurn{
    curTurn++;
    if(curTurn >= self.players.count){
        return 0;
    }
    return curTurn;
    
}
-(void)printCurScore{
    NSString *curScore = @"SCORE: ";
    for (Player *player in self.players) {
        curScore = [curScore stringByAppendingString:[player printPos:NO]];
    }
    NSLog(@"\n\n%@\n\n",curScore);
}


@end
