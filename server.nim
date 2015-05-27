import os, osproc, strutils, jester, asyncdispatch, htmlgen

settings:
  port = Port(8080)
  bindAddr = "0.0.0.0"

routes:
  get "/":
    redirect "/index.html"
    
  post "/":
    var fname = "/tmp/nimtest.nim"
    fname.writeFile($request.params["source"])
    var (output, exitCode) = execCmdEx("nim c -r --verbosity:0 " & fname)
    resp(output)
    
runForever()
