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
