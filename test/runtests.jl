using MarkdownRenderer, Test 

@testset "Header" begin
    @testset "Level 1" begin
        io = IOBuffer()
        render(io, Header(1, "Test"))
        @test String(take!(io)) == "# Test\n"
    end

    @testset "Level 2" begin
        io = IOBuffer()
        render(io, Header(2, "Test"))
        @test String(take!(io)) == "## Test\n"
    end

    @testset "Level 3" begin
        io = IOBuffer()
        render(io, Header(3, "Test"))
        @test String(take!(io)) == "### Test\n"
    end

    @testset "Level 4" begin
        io = IOBuffer()
        render(io, Header(4, "Test"))
        @test String(take!(io)) == "#### Test\n"
    end

    @testset "Level 5" begin
        io = IOBuffer()
        render(io, Header(5, "Test"))
        @test String(take!(io)) == "##### Test\n"
    end

    @testset "Level 6" begin
        io = IOBuffer()
        render(io, Header(6, "Test"))
        @test String(take!(io)) == "###### Test\n"
    end
end

@testset "Paragraph" begin
    io = IOBuffer()
    render(io, Paragraph("Test"))
    @test String(take!(io)) == "Test\n"
end

@testset "CodeBlock" begin
    io = IOBuffer()
    render(io, CodeBlock("julia", "println(\"Hello\")"))
    @test String(take!(io)) == "```julia\nprintln(\"Hello\")\n```\n"
end

@testset "Image" begin
    io = IOBuffer()
    render(io, Image("Test", "test.png"))
    @test String(take!(io)) == "![Test](test.png)\n"
end

@testset "Link" begin
    io = IOBuffer()
    render(io, Link("Test", "test.png"))
    @test String(take!(io)) == "[Test](test.png)\n"
end

@testset "Quoted" begin
    io = IOBuffer()
    render(io, Quoted("Test"))
    @test String(take!(io)) == "> Test\n"
end

@testset "HorizontalRule" begin
    io = IOBuffer()
    render(io, HorizontalRule())
    @test String(take!(io)) == "----\n"
end

@testset "OrderedList" begin
    io = IOBuffer()
    render(io, OrderedList(["Test"]))
    @test String(take!(io)) == "1. Test\n"
end

@testset "UnorderedList" begin
    io = IOBuffer()
    render(io, UnorderedList(["Test"]))
    @test String(take!(io)) == "- Test\n"
end

@testset "Table" begin
    io = IOBuffer()
    render(io, Table(["Test", "Test"], ["R1C1" "R1C2"; "R2C1" "R2C2"]))
    @test String(take!(io)) == "| Test | Test |\n|--|--|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |\n"
end

@testset "Group of objects" begin
    io = IOBuffer()
    objects = [
        Header(1, "Test"),
        Paragraph("Test"),
        CodeBlock("julia", "println(\"Hello\")"),
        Image("Test", "test.png"),
        Link("Test", "test.png"),
        Quoted("Test"),
        HorizontalRule(),
        OrderedList(["Test"]),
        UnorderedList(["Test"])
    ]
    render(io, objects)
    @test String(take!(io)) == "# Test\nTest\n```julia\nprintln(\"Hello\")\n```\n![Test](test.png)\n[Test](test.png)\n> Test\n----\n1. Test\n- Test\n"
end

