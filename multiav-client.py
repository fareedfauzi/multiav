#!/usr/bin/python

import os
import sys
import json
import pprint

import postfile

#-----------------------------------------------------------------------
class CMultiAvUploader:
  def __init__(self, host):
    self.host = host

  def scan(self, filename):
    selector = "/api/upload_fast"
    file_buf = open(filename, "rb").read()
    files = [("file_upload", os.path.basename(filename), file_buf)]
    json_txt = postfile.post_multipart(self.host, selector, [], files)
    d = json.loads(json_txt)
    return d

#-----------------------------------------------------------------------
def usage():
  print "Usage:", sys.argv[0], "<multi-av host> <filename>"

#-----------------------------------------------------------------------
def main(url, filename):
  scanner = CMultiAvUploader(url)
  ret = scanner.scan(filename)
  print "Results:\n"
  pprint.pprint(ret)

if __name__ == "__main__":
  if len(sys.argv) != 3:
    usage()
  else:
    main(sys.argv[1], sys.argv[2])