from os import listdir
from os.path import join


def parenthesize(value):
    if value[0] == '"':
        value = value[1:]
    if value[-1] == '"':
        value = value[:-1]
    return f"'{value}'"


table_name_mapper = {"STUD": "students",
                     "CLG": "college",
                     "PROF": "professors"}

column_name_mapper = {"S.": "student_id",
                      'SNAME': 'student_name',
                      'CITY': 'city',
                      'AVG': 'average',
                      "CLG.": 'college_id',
                      'CLGNAME': 'college_name',
                      'PNAME': 'professor_name'}


def table_mapper(x):
    # if x in table_name_mapper:
    #     return table_name_mapper[x]
    # else:
    #     return x
    return table_name_mapper.get(x, x)


def column_mapper(x):
    return column_name_mapper.get(x, x)


DATA_FOLDER = "DATA"
SEPARATOR = ','
for file_name in listdir(DATA_FOLDER):
    if file_name.split(".")[-1].lower() == 'csv':
        with open(join(DATA_FOLDER, file_name), encoding="utf-8-sig") as f:
            query = [
                f'insert into `{table_mapper(file_name.rsplit(".", 1)[0])}` '
                f'({",".join([f"`{column_mapper(i)}`" for i in f.readline()[:-1].split(SEPARATOR)])}) values']
            for line in f:
                query.append(f'''({", ".join([parenthesize(cell) for cell in line[:-1].split(SEPARATOR)])})''')
            query = f'{query[0]} {",".join(query[1:])}'
        print(query)
