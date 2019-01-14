//
//  GameManager.h
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputManager.h"
#import "Player.h"
#import "MoveManager.h"

NS_ASSUME_NONNULL_BEGIN
enum GameState{
    PLAYING,
    SETUP
};
@interface GameManager : NSObject
-(BOOL)playing;
@end

NS_ASSUME_NONNULL_END
