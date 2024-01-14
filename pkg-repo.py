#!/usr/bin/env python3

import argparse
import os
import re
import shutil
import sys

from pathlib import Path

abbr_home_path = lambda path: str(path).replace(os.path.expanduser('~'), '~', 1)

def check_version(args):
    found_old_ver_strs = False
    for filename in os.listdir(Path(__file__).parent):
        path = Path(Path(__file__).parent, filename)
        if (
            filename == "changelog.md" or
            filename.split('.')[-1] not in ["md", "typ", "toml"]):
            continue
        with open(path, 'r') as f:
            for i, line in enumerate(f.readlines()):
                # The version strings in these lines are not this package's, so
                # they shouldn't be checked. Very naive filtering, but it
                # suffices for now.
                if (filename.endswith(".toml") and
                    re.match(r"^compiler = \".+\"", line)):
                    continue
                if re.match(r"[Tt]ypst v?.+", line):
                    continue
                old_vers = list(
                    filter(lambda e: e != args.version,
                        re.findall(r"\d+\.\d+\.\d+", line)))
                if len(old_vers):
                    found_old_ver_strs = True
                    print(
                        f"{filename}:{i+1} refers to a wrong version:\n" +
                        f"\t\x1b[2m{line.rstrip()}\x1b[0m")
    if found_old_ver_strs:
        sys.exit(">> Please fix the lines above.")
    else:
        print(">> Checked version strings are updated in files.")

FILES_TO_COPY = [
    "physica.typ",
    "README.md",
    "typst.toml",
    "LICENSE.txt",
]

def copy_file(dest, filename):
    source_path = Path(__file__).parent.joinpath(filename).resolve()
    target_path = Path(dest, filename).resolve()
    print(f"\x1b[2mCopying {filename}, {os.path.getsize(source_path)} B\x1b[0m")
    shutil.copyfile(source_path, target_path)

def copy_files(args):
    # https://github.com/typst/packages/tree/main#submission-guidelines
    physica_dir = Path(
        args.repo_dir, 'packages', 'preview', 'physica', f'{args.version}')
    try:
        os.makedirs(physica_dir, exist_ok = True)
    except FileExistsError:
        sys.exit(
            f"Directory already exists: {abbr_home_path(physica_dir)}")
    print(f">> {len(FILES_TO_COPY)} files to copy.")
    for filename in FILES_TO_COPY:
        copy_file(physica_dir, filename)
    print(f">> Files in {abbr_home_path(physica_dir)}:")
    print(os.listdir(physica_dir))

def main():
    parser = argparse.ArgumentParser('Copy files to the Typst packages repo')
    parser.add_argument(
        '--version', required=True, help="semantic version, major.minor.build")
    parser.add_argument(
        '--repo-dir', required=True, help="root of that Typst packages repo")
    args = parser.parse_args()

    check_version(args)
    copy_files(args)

if __name__ == "__main__":
    sys.exit(main())
