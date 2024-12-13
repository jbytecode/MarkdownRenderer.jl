module MarkdownRenderer

export render 
export MarkDownObject
export Header 
export Paragraph
export CodeBlock
export Image
export Table
export Link
export Quoted
export HorizontalRule
export OrderedList
export UnorderedList


abstract type MarkDownObject end 

struct Header <: MarkDownObject
    level::Int
    text::String
end

struct Paragraph <: MarkDownObject
    text::String
end

struct CodeBlock <: MarkDownObject
    language::String
    text::String
end

struct Image <: MarkDownObject
    description::String
    url::String
end

struct Table <: MarkDownObject
    headers::Vector 
    data::Matrix
end

struct Link <: MarkDownObject
    description::String
    url::String
end

struct Quoted <: MarkDownObject
    text::String
end

struct HorizontalRule <: MarkDownObject end

struct OrderedList <: MarkDownObject
    text::Vector
end

struct UnorderedList <: MarkDownObject
    text::Vector
end


function render(io::IO, header::Header)
    hashes = ["#" for _ in 1:header.level] |> join
    println(io, hashes, " ", header.text)
end 

function render(io::IO, paragraph::Paragraph)
    println(io, paragraph.text)
end

function render(io::IO, codeblock::CodeBlock)
    println(io, "```", codeblock.language)
    println(io, codeblock.text)
    println(io, "```")
end

function render(io::IO, image::Image)
    println(io, "![", image.description, "](", image.url, ")")
end

function render(io::IO, table::Table)
    println(io, "| ", join(table.headers, " | "), " |")
    println(io, "|", join(["-" for _ in 1:length(table.headers)], "-|"), "-|")
    n, p = size(table.data)
    for i in 1:n
        println(io, "| ", join(table.data[i, :], " | "), " |")
    end
end

function render(io::IO, link::Link)
    println(io, "[", link.description, "](", link.url, ")")
end

function render(io::IO, q::Quoted)
    println(io, "> ", q.text)
end

function render(io::IO, hr::HorizontalRule)
    println(io, "----")
end

function render(io::IO, ol::OrderedList)
    for i in 1:length(ol.text)
        println(io, i, ". ", ol.text[i])
    end
end

function render(io::IO, ul::UnorderedList)
    for i in 1:length(ul.text)
        println(io, "- ", ul.text[i])
    end
end

function render(io::IO, objects::Vector{T}) where T <: MarkDownObject
    for object in objects
        render(io, object)
    end
end




end # module MarkdownRenderer
