from asm.Asm import *
from asm.Registers import Registers
from tree.nodes.Node import Node
from tree.nodes.operations.OperationType import OperationType


class UnaryOperation(Node):
    def __init__(self, operation, postfix=False, parent=None):
        self.operation = operation
        self.postfix = postfix
        super(UnaryOperation, self).__init__(parent=parent)

    def get_code(self):
        code = ""

        if len(self.statements) > 1:
            expression = self.statements[1]
        else:
            expression = None

        code += self.operation.get_unary_operation_code(self.postfix, self.statements[0], expression, self.parent)

        return code

    def __str__(self):
        statementsString = self.printStatements()
        return "UnaryOperation {}: {}".format(self.operation,
                                                 statementsString)
