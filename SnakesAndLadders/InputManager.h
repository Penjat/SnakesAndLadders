//
//  InputManager.h
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputManager : NSObject
+(NSString*)getPlayerInput:(BOOL)caseMatters;
@end

NS_ASSUME_NONNULL_END
