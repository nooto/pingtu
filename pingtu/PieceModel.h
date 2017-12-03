//
//  PieceModel.h
//  pingtu
//
//  Created by MacBook on 2017/11/29.
//  Copyright © 2017年 MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PieceModel : NSObject

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float w;
@property (nonatomic) float h;
@property (nonatomic) float centerX;
@property (nonatomic) float centerY;
@property (nonatomic) NSInteger index;
@property (nonatomic) BOOL isRightP;//是否正确的位置

- (id)initPieceModelWithDic:(NSDictionary *)dic;

@end
