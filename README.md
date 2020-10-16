# PlotRandomValues in Julia

The code is "simple"
```
#!/usr/bin/env julia
module PlotRandomValues

using GRUtils

function julia_main()
    try
        real_main()
    catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end

function real_main()
    println("real_main:+")
    p = plot(rand(5), rand(5))
    display(p)
    print("real_main: hit return to continue:")
    readline()
    println("real_main:-")
    return
end

if abspath(PROGRAM_FILE) == @__FILE__
    # real_main()
    real_main()
end

end # module
```
An can be run if julia is installed directly because
I added the shebang:
```
wink@3900x:~/prgs/julia/projects/PlotRandomValues (master)
$ ./src/PlotRandomValues.jl 
real_main:+
real_main: hit return to continue:
real_main:-
```

And it displays a simple graph of random lines:

![graph](./data/graph.png)

You can also create a compiled version of the program using the
[PackageCompiler](https://github.com/JuliaLang/PackageCompiler.jl) in
Julia REPL from commandline:
```
wink@3900x:~/prgs/julia/projects/PlotRandomValues (master)
$ cd ..
wink@3900x:~/prgs/julia/projects
$ julia -e 'using PackageCompiler; create_app("PlotRandomValues", "PlotRandomValuesCompiled", force=true)'
┌ Warning: Package GR has a build script, this might indicate that it is not relocatable
└ @ PackageCompiler ~/.julia/packages/PackageCompiler/Beagl/src/PackageCompiler.jl:526
[ Info: PackageCompiler: creating base system image (incremental=false)...
```

And Then executed as an executable:
```
wink@3900x:~/prgs/julia/projects
$ time ./PlotRandomValuesCompiled/bin/PlotRandomValues

real_main:+
real_main: hit return to continue:
real_main:-

real	0m4.061s
user	0m3.755s
sys	0m0.481s
```
