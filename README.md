# CommandModelTest
命令模式练习：四大角色-抽象接口、具体命令、接收者、请求者
Swift设计命令模式
		案例一：普通案例？->示例代码?
			开发地方用到命令：
				画板（撤销、圆形画笔、方形画笔、弧线画笔）
				购物车商品（命令模式）
				消息处理
		案例二：命令模式->设计？->基本命令模式设计？
			角色一：命令接口->TMCommandProtocol
			角色二：具体命令->TMLeftCommand
				TMRightCommand、TMTransformCommand
			角色三：接收者
				TetrisMachine
			角色四：请求者
				TetrisMachineManager

		案例三：命令模式->OC实现？->动态命令？
			代码冗余非常大（类爆炸问题）
			角色一：CommandProtocol
			角色二：DynamicCommand->具体命令
				闭包->block
				Java开发也是如此
			角色三：接收者
				TetrisMachine
			角色四：请求者
				DynamicCommandInvoke
				闭包基础知识：http://www.runoob.com/swift/swift-closures.html

		案例四：命令模式->Swift实现->优化代码->复合命令？
			

		案例五：命令模式->Swift实现->优化代码->泛型命令？
			角色一：CommandProtocol
			角色二：GenericsCommand->泛型命令
			角色三：接收者->T类型
			角色四：请求者
				GenericsCommandInvoke
				基于泛型设计->讲解框架设计（大量使用泛型）
				两个框架设计：一个是OC设计，另一个是Swift泛型设计
				用到很多种设计模式
				设计模式->理论（工具，基础零件）
				设计出来的框架运用到我们的实际开发当中
		案例六：命令模式->Swift实现->并发处理？
			最简单的代码->最高级抽象代码
			QueueCommandInvoke
		
		案例七：命令模式->Swift实现->闭包命令？
			BlockCommandInvoke
