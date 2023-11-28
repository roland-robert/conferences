from logging import warn
from orm_sqlalchemy.create_all import create_all, populate_all
import sys
import warnings


# run in console :
# python executor.py {request}

def main():
    try:
        req = sys.argv[1]
    except IndexError:
        warnings.warn(
            f'No argument passed to executor.py, nothing will occur.')
        return

    match req:
        case 'create_all':
            create_all()
        case 'populate_all':
            populate_all()
        case 'create_and_populate_all':
            create_all()
            populate_all()
        case _:
            warnings.warn(
                f'Using executor.py with non recognized request : {req}, nothing will occur.')


if __name__ == '__main__':
    main()
