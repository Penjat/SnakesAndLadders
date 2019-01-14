//
//  Player.h
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (strong,nonatomic) NSNumber *curTile;
@property (strong,nonatomic) NSString *name;

-(void)roll;
@end

NS_ASSUME_NONNULL_END
