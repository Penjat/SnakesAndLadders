//
//  MoveManager.h
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
NS_ASSUME_NONNULL_BEGIN

@interface MoveManager : NSObject

@property (strong,nonatomic) NSDictionary<NSNumber*,NSNumber*>* specialTiles;
-(instancetype)init;
-(void)checkItle:(Player*)player;
-(BOOL)checkGameOver:(Player*)player;
@end

NS_ASSUME_NONNULL_END
