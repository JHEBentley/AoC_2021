input = open("Day01/input.txt") do file
    readlines(file)
end

#Convert from strings to ints
input = parse.(Int, input)

function FindMaxIncreasing(input, windowSize)
    prev = Inf
    counter = 0

    inputSize = size(input)[1]

    for i in windowSize:inputSize
        
        window = 0

        for j in 0:windowSize - 1
            window = window + input[i - j]
        end

        if window > prev
            counter = counter + 1
        end

        prev = window
    end
    
    return counter
end

#This seems more reusable now, as the size of the window can be defined as a variable
print(FindMaxIncreasing(input, 3))