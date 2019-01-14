//
//  MoveManager.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "MoveManager.h"

@implementation MoveManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _specialTiles = @{@4:@14,@17:@7,@9:@31,@20:@38,@89:@26,@28:@84,@40:@59,@51:@67,@64:@60,@63:@81,@99:@78,@95:@75};
    }
    return self;
}
-(void)checkItle:(Player *)player{
    if([self.specialTiles objectForKey:[player curTile] ] != nil){
        NSNumber *oldTile = [player curTile];
        NSNumber *newTile = self.specialTiles[oldTile];
        
        if([newTile isLessThan:oldTile]){
            //is a snake
            NSLog(@"Landed on a snake!!! Sliding down to %@." ,newTile);
            return;
        }else{
            NSLog(@"Landed on a ladder!!! Climbing up to %@." ,newTile);
        }
        [player setCurTile:newTile];
        
    }
}
-(BOOL)checkGameOver:(Player *)player{
    if([[player curTile] isGreaterThanOrEqualTo:@100]){
        return YES;
    }
    return NO;
}
@end
