def filename_directive(filename):
    return "\t.file\t\"{0}\"\n".format(filename)


def compiler_ident_directive():
    return "\t.ident\t\"{0}\"\n".format("HEROCOMP - Tomas Mikula 2017")


def text_directive():
    return "\t.text\n"


def global_directive(arg):
    return "\t.global\t{0}\n".format(arg)


def label(name):
    return "{0}:\n".format(name)


def push(arg):
    return "\tpushq\t{0}\n".format(arg)


def pop(arg):
    return "\tpopq\t{0}\n".format(arg)


def mov(value, destination):
    return "\tmovq\t{0}, {1}\n".format(value, destination)


def ret():
    return "\tret\n"


def leave():
    return "\tleave\n"

    
def call(name):
    return "\tcall\t{0}\n".format(name)