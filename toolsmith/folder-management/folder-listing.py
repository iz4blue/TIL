import csv
import os
import sys


def load_config(path):
	targets = list()

	with open(path) as f:
		tr = csv.reader(f, delimiter='\t')

		next(tr)
		for row in tr:
			targets.append(row[2])

	return targets


def compress_target(path, dry_run=True):
	filename = os.path.basename(path)

	cmd_compress = f"cd {path} && tar czf {filename}.tar.gz {filename}"
	cmd_delete = f"cd {path} && rm -rf ./"

	if dry_run:
		print(cmd_compress)
		print(cmd_delete)
		return


if __name__ == '__main__':
	target_paths = load_config(sys.argv[1])

	print('#!/bin/bash')
	print('set -e')
	
	for p in target_paths:
		compress_target(p)
