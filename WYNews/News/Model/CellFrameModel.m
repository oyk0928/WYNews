//
//  CellFrameModel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/22.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "CellFrameModel.h"

@implementation CellFrameModel

-(void)setModel:(NewsModel *)model {
    _model = model;
    if (model.hasHead && model.photosetID) {
        self.identifier = @"TopImageCell";
        self.cellHeight = 215;
    }else if (model.hasHead){
        self.identifier = @"TopTxtCell";
        self.cellHeight = 215;
    }else if (model.imgType){
        self.identifier = @"BigImageCell";
        self.cellHeight = 170;
    }else if (model.imgextra){
        self.identifier = @"ImagesCell";
        self.cellHeight = 130;
    }else{
        self.identifier = @"NewsCell";
        self.cellHeight = 80;
    }

}
@end
