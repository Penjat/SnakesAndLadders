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
        NSString *nameInput = [InputManager getPlayerInput];
        
        //if name left blank
        if([nameInput isEqualToString:@""]){
            nameInput = [NSString stringWithFormat:@"Player %i",(i+1)];
            NSLog(@"defaulting to %@",nameInput);
        }
        
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
    
    Player *player1 = [[Player alloc] init];
    MoveManager *moveManager = [[MoveManager alloc] init];
    enum GameState gameState = SETUP;
    NSUInteger curTurn = 0;
    
    while(true){
        
        
        
        
        
        if(gameState == SETUP){
            NSLog(@"please enter the number of players");
            NSString *input = [InputManager getPlayerInput];
            
            
            if([self setUp:input]){
                //if set up sucsessfully, start playing
                //TODO print 'playing a game with:'
                gameState = PLAYING;
            }
        }else if(gameState == PLAYING){
            Player *curPlayer = self.players[curTurn];
            NSLog(@"%@'s turn",[curPlayer name]);
            NSString *input = [InputManager getPlayerInput];
            if([input isEqualToString:@"roll"] || [input isEqualToString:@"r"] ){
                [curPlayer roll];
                [moveManager checkItle:curPlayer];
                if([moveManager checkGameOver:curPlayer]){
                    NSLog(@"%@ wins!!!",curPlayer.name);
                    
                    return NO;
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

@end
