#!/usr/bin/env python3

import argparse
import os
import shutil
import sys

from pathlib import Path

FILES = [
    "physica.typ",
    "README.md",
    "typst.toml",
    "LICENSE.txt",
]

def copy_file(dest, file):
    source_path = Path(__file__, "..", file).resolve()
    target_path = Path(dest, file).resolve()
    print(f"{source_path} -->\n\t{target_path}")
    shutil.copyfile(source_path, target_path)

def copy_files(args):
    # https://github.com/typst/packages/tree/main#submission-guidelines
    physica_dir = Path(args.repo_dir, 'packages', 'preview', f'physica-{args.version}')
    os.makedirs(physica_dir, exist_ok = False)
    print(f"Destination: {physica_dir}")
    for file in FILES:
        copy_file(physica_dir, file)
    print("ls:")
    print(os.listdir(physica_dir))

def main():
    parser = argparse.ArgumentParser('Copy files to official Typst packages repo')
    parser.add_argument('--version', required=True, help="version, e.g. 0.7.5")
    parser.add_argument('--repo-dir', required=True, help="repo root")
    args = parser.parse_args()

    copy_files(args)

if __name__ == "__main__":
    sys.exit(main())