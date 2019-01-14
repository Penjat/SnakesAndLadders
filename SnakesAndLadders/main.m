//
//  main.m
//  SnakesAndLadders
//
//  Created by Spencer Symington on 2019-01-13.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        
        GameManager *gameManager = [[GameManager alloc]init];
        BOOL isPlaying = YES;
        while(isPlaying){
            isPlaying = [gameManager playing];
            
        }
    }
    return 0;
}
