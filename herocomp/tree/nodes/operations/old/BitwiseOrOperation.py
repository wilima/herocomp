from tree.nodes.operations.BinaryOperation import BinaryOperation
from tree.nodes.operations.OperationType import OperationType


class BitwiseOrOperation(BinaryOperation):
    def __init__(self, operation, parent=None):
        super(BitwiseOrOperation, self).__init__(operation=operation,

                                                parent=parent)

    def __str__(self):
        statementsString = self.printStatements()
        return "BitwiseOrOperation {}: {}".format(self.operation,
                                                 statementsString)