import json


courses = '{"name": "krishna", "language": ["java", "python"]}'


# Json loads method will parse the string and return the dictionary object


dic_o = json.loads(courses)

print(dic_o['language'][0])


