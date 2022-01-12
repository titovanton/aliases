clean_pyc() {
  sudo find . -name '__pycache__' -exec rm -r {} \;
  sudo find . -name '*.pyc' -exec rm {} \;
}

alias clean_pyc=clean_pyc
