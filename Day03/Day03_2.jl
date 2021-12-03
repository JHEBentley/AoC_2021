input = open("Day03\\input.txt") do file
    readlines(file)
end

report = [split(line, "") for line in input]
report = [parse.(Int, row) for row in report]


#There's probably a way to combine these into 1 function, but it's a busy day today
function OGR(ogr)
    #For each column
    for col in 1:size(ogr[1])[1]
        count = Dict(1 => 0, 0 => 0)
        
        #For each row, count occurances
        for row in ogr
            count[row[col]] += 1
        end

        most = 1
        if count[0] > count[1]
            most = 0
        end

        ogr = filter(x -> x[col] == most, ogr)

        if size(ogr)[1] <= 1
            break
        end
    end

    return ogr
end

function CO2(co2)
    #For each column
    for col in 1:size(co2[1])[1]
        count = Dict(1 => 0, 0 => 0)
        
        #For each row, count occurances
        for row in co2
            count[row[col]] += 1
        end

        most = 0
        if count[0] > count[1]
            most = 1
        end

        co2 = filter(x -> x[col] == most, co2)

        if size(co2)[1] <= 1
            break
        end
    end

    return co2
end

ogr = parse(Int, join(OGR(report)[1]), base = 2)
co2 = parse(Int, join(CO2(report)[1]), base = 2)

print(ogr * co2)