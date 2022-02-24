import os
import sys
from os.path import getsize, join

CNT_MIN = 100
SIZE_MIN = 100 * 1024 * 1024

# 공통적 상황
IGNORE_PATH = (
    '.git', '.idea', 'venv', 'node_modules', '.terraform', '.vagrant',
)

# 그것을 제외 하고도 필요한 경우
IGNORE_PATH = (
    'site-packages', *IGNORE_PATH
)


def cnt_files(path, sum_size=0, sum_count=0):
    listdir = os.listdir(path)

    for x in listdir:
        p = os.path.join(path, x)

        if os.path.isdir(p):
            s, c = cnt_files(p)
            sum_size += s
            sum_count += c

        sum_count += 1
        if os.path.islink(p):
            continue

        sum_size += os.path.getsize(p)

    for t in IGNORE_PATH:
        if t in path:
            return sum_size, sum_count

    print(f"{sum_size:15d}\t{sum_count:8d}\t{path}")
    return sum_size, sum_count


if __name__ == '__main__':
    cnt_files(sys.argv[1])

