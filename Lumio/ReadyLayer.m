//
//  ReadyLayer.m
//  Lumio
//
//  Created by Joanne Dyer on 2/27/13.
//  Copyright 2013 Joanne Dyer. All rights reserved.
//

#import "ReadyLayer.h"
#import "GameLayer.h"
#import "GameConfig.h"

//simple layer that covers up the game layer when it starts and is removed when you tap it.
@interface ReadyLayer ()

@end

@implementation ReadyLayer

- (id)init
{
    if( (self=[super init]) ) {
        
        CGSize size = [CCDirector sharedDirector].viewSize;
        self.contentSize = size;
        
        CCSprite *background = [CCSprite spriteWithImageNamed:@"ReadyLayer.png"];
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background z:0];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

//- (void)registerWithTouchDispatcher
//{
//    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
//}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
}

//when the layer is touched anywhere, remove it and unpause game layer.
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    GameLayer *gameLayer = (GameLayer *)[[[CCDirector sharedDirector] runningScene] getChildByName:GAME_LAYER_TAG recursively:NO];
    [gameLayer unPauseGame];
    [self removeFromParentAndCleanup:YES];
}

@end
