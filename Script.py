from tempfile import mkstemp
from shutil import move, copyfile
from os import fdopen, remove
from subprocess import call
import os

def replace(file_path, pattern, subst):
    fh,abs_path=mkstemp()
    with fdopen(fh,'w')as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                new_file.write(line.replace(pattern, subst))
        remove(file_path)
        move(abs_path, file_path)



width=[0.0025,0.005,0.01,0.05]
height=[0.02,0.025,0.05,0.1]
for k in range(0,len(width)):
    ##make directory and run in new directory
    path='run'+str(k)
    os.makedirs(path)
    copyfile('Makefile',path+'/Makefile')
    copyfile('std.opt',path+'/std.opt')
    copyfile('IBOFlowTest.cc',path+'/IBOFlowTest.cc')

    w=width[k]
    h=height[k]
    # -----copy the airdata to run directory and start to run
    fname=path+'/airdata.xml'
    forig='airData/airdata.xml'
    copyfile(forig,fname)
    ri = '<Outer>outer</Outer>'
    ro='<Outer>'+str(w)+'</Outer>'
    replace(fname,ri,ro)
    hi = '<Height>height</Height>'
    ho='<Height>'+str(h)+'</Height>'
    replace(fname,hi,ho)
    #-----copy the brush in run directory and modify it
    fname=path+'/brush.xml'
    forig='airData/brush.xml'
    copyfile(forig,fname)
    ri='airData/airdata.xml'
    ro=path+'/airdata.xml'
    replace(fname,ri,ro)
    #-----cd into the directory and start the simulation and cd out
    os.chdir(path)
    call('pwd',shell=True)
    call('make',shell=True)
    os.chdir('..')
  
