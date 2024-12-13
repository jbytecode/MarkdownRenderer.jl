# MarkdownRenderer.jl

Custom Markdown Renderer for Julia


## Installation 

```julia
julia> ]
(@v1.11) pkg> add https://github.com/jbytecode/MarkdownRenderer.jl 
```

## Usage 

```julia
using MarkdownRenderer 

io = IOBuffer()
# or 
# io = open("test.md", "w")
# io => stdout for console output
render(io, Header(1, "Test"))
render(io, Header(2, "Test"))
render(io, Header(3, "Test"))
render(io, Header(4, "Test"))
render(io, Header(5, "Test"))
render(io, Header(6, "Test"))
render(io, Paragraph("Test"))
render(io, CodeBlock("julia", "println(1)"))
render(io, Image("Description","test.png"))
render(io, Table(["a", "b"], [1 2; 3 4]))
render(io, Link("Description", "test.png"))
render(io, Quoted("Test"))
render(io, HorizontalRule())
render(io, OrderedList(["item1", "item2"]))
render(io, UnorderedList(["item1", "item2"]))
# close(io)
```
