//
//  DynamicCommand.swift
//  CommandModelTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation
//动态命令
//角色二：DynamicCommand->具体命令
class DynamicCommand: CommandProtocol {
    
    
    private var reciver:TetrisMachine
    private var block:(TetrisMachine)->Void
    //定义构造方法
    init(reciver:TetrisMachine,block:@escaping(TetrisMachine)->Void) {
        self.reciver = reciver
        self.block = block;
    }
    
    //执行逻辑
    func execute() {
        self.block(self.reciver)
    }
    //提供一个创建动态命令方法->类方法
    class func creatCommand(reciver:TetrisMachine,block:@escaping(TetrisMachine)->Void) -> CommandProtocol {
        return DynamicCommand(reciver: reciver, block: block)
    }
}

