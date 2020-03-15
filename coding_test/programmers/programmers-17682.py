# https://programmers.co.kr/learn/courses/30/lessons/17682?language=python3#


import re
OPTION_DOUBLE = 'D'

def calculator(string):
    p = re.compile(r'(\d{1,2})([SDT]+)([\*\#]*)')
    token = p.match(string)
    
    num = int(token[1])
    if token[2] == 'S':
        pass
    elif token[2] == 'D':
        num = num ** 2
    elif token[2] == 'T':
        num = num ** 3
    
    option = None
    if token[3] == '*':
        option = OPTION_DOUBLE
    elif token[3] == '#':
        num = num * -1
        
    return num, option

def solution(dartResult):
    answer = 0
    ret_list = list()
    
    p = re.compile(r'(\d{1,2}[SDT]+[\*\#]*)')
    token = p.findall(dartResult)
    
    for idx, t in enumerate(token):
        _ret = calculator(t)
        ret_list.append(list(_ret))
        
        if _ret[1] == OPTION_DOUBLE:
            if idx == 0:
                ret_list[0][0] = ret_list[0][0] * 2
            elif idx == 1:
                ret_list[0][0] = ret_list[0][0] * 2
                ret_list[1][0] = ret_list[1][0] * 2
            elif idx == 2:
                ret_list[1][0] = ret_list[1][0] * 2
                ret_list[2][0] = ret_list[2][0] * 2

    for r in ret_list:
        answer += r[0]
                
    return answer

