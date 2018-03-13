
def get_syntastic_flags():
    with open('.syntastic_cpp_config') as fin:
        for line in fin:
            lineargs = line.strip().split()
            for a in lineargs:
                yield a

def FlagsForFile( filename, **kwargs ):

    vanilla_flags = [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ]
    syntastic_flags = [a for a in get_syntastic_flags()]

    return {
        'flags': vanilla_flags + syntastic_flags,
    }
