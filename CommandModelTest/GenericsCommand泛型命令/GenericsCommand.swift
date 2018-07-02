//
//  GenericsCommand.swift
//  CommandModelTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

import Foundation

class GenericsCommand<T>: CommandProtocol {
    
    private var reciver:T
    private var block:(T)->Void
    //定义构造方法
    init(reciver:T,block:@escaping(T)->Void) {
        self.reciver = reciver
        self.block = block;
    }
    
    //执行逻辑
    func execute() {
        self.block(self.reciver)
    }
    //提供一个创建动态命令方法->类方法
    class func creatCommand(reciver:T,block:@escaping(T)->Void) -> CommandProtocol {
        return GenericsCommand(reciver: reciver, block: block)
    }
}
