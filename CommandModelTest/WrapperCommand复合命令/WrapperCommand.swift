//
//  WrapperCommand.swift
//  CommandModelTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation

//复合命令(执行多个命令)->多个
class WrapperCommand: CommandProtocol {
    
    private var commands:Array<CommandProtocol>
    
    //定义构造方法
    init(commands:Array<CommandProtocol>) {
        self.commands = commands
    }
    //执行逻辑
    func execute() {
        for command in self.commands {
            command.execute()
        }
    }
    
    
}
