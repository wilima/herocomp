import tree
from asm.Asm import *
from asm.Registers import Registers
from tree.nodes.Node import Node


class Identifier(Node):
    def __init__(self, name, parent=None):
        self.name = name
        super(Identifier, self).__init__(parent)

    def __str__(self):
        return "Identifier: {}".format(self.name)

    def get_stack_offset(self):
        parent = self.parent
        offset = None

        while parent.parent is not None:
            if isinstance(parent, tree.nodes.Block.Block):
                try:
                    offset = parent.variables_table.get_variable_offset(self.name)
                except ValueError as e:
                    pass
                else:
                    break
            parent = parent.parent

        if offset is None:
            error_string = "Variable {0} is not declared a".format(self.name)
            raise ValueError(error_string)

        return offset

    def _get_argument_location(self):
        parent = self.parent
        location = None

        while parent.parent is not None:
            if isinstance(parent, tree.nodes.Function.Function):
                location = parent.arguments_table.get(self.name)
                break

            parent = parent.parent

        if location is None:
            error_string = "Variable {0} is not an argument of the function".format(self.name)
            raise ValueError(error_string)

        return location, None

    def _get_global_variable(self):
        parent = self.parent

        while parent.parent is not None:
            if isinstance(parent, tree.nodes.Program.Program):
                break

            parent = parent.parent

        try:
            address = parent.variables_table.get_variable_offset(self.name)
        except ValueError as e:
            error_string = "Variable {0} is not defined".format(self.name)
            raise ValueError(error_string)

        return address

    def get_value_address(self):
        try:
            offset = self.get_stack_offset()
            return str(offset) + Registers.RBP.dereference()
        except Exception as e:
            try:
                return self._get_argument_location()
            except Exception as e:
                try:
                    address = self._get_global_variable()
                    return str(address) + Registers.RIP.dereference()
                except Exception as e:
                    raise

    # only for global variables
    def get_value_type(self):
        parent = self.parent

        while parent.parent is not None:
            if isinstance(parent, tree.nodes.Program.Program):
                break

            parent = parent.parent

        try:
            var_type = parent.variables_table.get_variable_type(self.name)
        except ValueError as e:
            error_string = "Variable {0} is not a global variable".format(self.name)
            raise ValueError(error_string)

        return var_type

    def is_function(self):
        parent = self.parent

        while parent.parent is not None:
            if isinstance(parent, tree.nodes.Program.Program):
                break

            parent = parent.parent

        return self.name in parent.functions_table

    def get_code(self):
        address = self.get_value_address()

        return instruction("movq", address, Registers.RAX)
