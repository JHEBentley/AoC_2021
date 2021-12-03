input = open("Day03\\input.txt") do file
    readlines(file)
end

report = [split(line, "") for line in input]
report = [parse.(Int, row) for row in report]

_gamma = Array{Int8}(undef, size(report[1])[1])

#For each column
for col in 1:size(report[1])[1]
    count = Dict(1 => 0, 0 => 0)
    
    #For each row, count occurances
    for row in report
        count[row[col]] += 1
    end

    _gamma[col] = (findmax(count)[2])
end

#Parse all the elements of gamma joined together from bin to dec
gamma = parse(Int, join(_gamma), base = 2)

#Epsilon will just be the bitflip of gamma, make sure to use a bitmask to only flip the last n bits though to prevent getting negatives!
epsilon = ~gamma & ((1 << size(_gamma)[1]) - 1)

print(gamma * epsilon)