input = open("Day01/input.txt") do file
    readlines(file)
end

#Convert from strings to ints
input = parse.(Int, input)

function FindMaxIncreasing(input)
    prev = Inf
    counter = 0

    for reading in input
        if reading > prev
            counter = counter + 1
        end

        prev = reading
    end

    return counter
end

print(FindMaxIncreasing(input))