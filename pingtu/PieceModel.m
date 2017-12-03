//
//  PieceModel.m
//  pingtu
//
//  Created by MacBook on 2017/11/29.
//  Copyright © 2017年 MacBook. All rights reserved.
//

#import "PieceModel.h"

@implementation PieceModel

- (id)initPieceModelWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        
        self.isRightP = NO;
        self.x = [dic[@"x"] floatValue];
        self.y = [dic[@"y"] floatValue];
        self.centerX = [dic[@"centerX"] floatValue];
        self.centerY = [dic[@"centerY"] floatValue];
        self.w = [dic[@"w"] floatValue];
        self.h = [dic[@"h"] floatValue];
        self.index = [dic[@"index"]integerValue];
    }
    return self;
}

@end
