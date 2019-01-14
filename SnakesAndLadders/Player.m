//
//  Player.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "Player.h"

@implementation Player
-(void)roll{
    int roll = arc4random_uniform(6)+1;
    self.curTile = @([_curTile integerValue]+roll);
    
    NSLog(@"%@ rolled %i, moving to %@",self.name,roll,self.curTile);
}
@end
