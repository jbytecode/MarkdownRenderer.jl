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

The rendered output is written to `io` and can be collected with 

```julia
md = String(take!(io))
"# Test\n## Test\n### Test\n#### Test\n##### Test\n###### Test\nTest\n```julia\nprintln(1)\n```\n![Description](test.png)\n| a | b |\n|--|--|\n| 1 | 2 |\n| 3 | 4 |\n[Description](test.png)\n> Test\n----\n1. item1\n2. item2\n- item1\n- item2\n"
```

and it is rendered as 

# Test
## Test
### Test
#### Test
##### Test
###### Test
Test
```julia
println(1)
```
![Description](test.png)
| a | b |
|--|--|
| 1 | 2 |
| 3 | 4 |
[Description](test.png)
> Test
----
1. item1
2. item2
- item1
- item2




