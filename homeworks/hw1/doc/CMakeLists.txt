cmake_minimum_required(VERSION 3.0)
project (hw1-doc)
include (../../UseLATEX.cmake)

add_latex_document (
  writeup.tex
  CONFIGURE writeup.tex
  DEFAULT_PDF
)
