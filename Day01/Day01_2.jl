input = open("Day01/input.txt") do file
    readlines(file)
end

#Convert from strings to ints
input = parse.(Int, input)

function FindMaxIncreasing(input)
    prev = Inf
    counter = 0

    inputLength = size(input)[1] - 3

    for i in 0:inputLength
        window = sum(
            [input[i + 1], 
            input[i + 2], 
            input[i + 3]]
            )

        if window > prev
            counter = counter + 1
        end

        prev = window
    end

    return counter
end

print(FindMaxIncreasing(input))