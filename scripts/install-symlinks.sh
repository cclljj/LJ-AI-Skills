#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <target-skills-directory> [skill-slug ...]" >&2
  exit 2
fi

target_dir=$1
shift
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)

mkdir -p "$target_dir"

install_skill() {
  skill_name=$1
  skill_dir="$source_dir/$skill_name"
  target_link="$target_dir/$skill_name"

  if [ ! -f "$skill_dir/SKILL.md" ]; then
    echo "Not a skill in this repository: $skill_name" >&2
    exit 1
  fi

  if [ -e "$target_link" ] || [ -L "$target_link" ]; then
    echo "Target already exists; not replacing: $target_link" >&2
    exit 1
  fi

  ln -s "$skill_dir" "$target_link"
  echo "Linked $skill_name -> $target_link"
}

if [ "$#" -gt 0 ]; then
  for skill_name in "$@"; do
    install_skill "$skill_name"
  done
else
  for skill_dir in "$source_dir"/*; do
    if [ -f "$skill_dir/SKILL.md" ]; then
      install_skill "$(basename "$skill_dir")"
    fi
  done
fi
