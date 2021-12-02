input = open("Day02/input.txt") do file
    readlines(file)
end

instructions = [split(instr, " ") for instr in input]

function Move(instruction, pos)
    dist = parse(Int, instruction[2])
    axis = 0

    if instruction[1] == "forward"
        axis = 1
    else
        axis = 2
        if instruction[1] == "up"
            dist = dist * -1
        end
    end

    pos[axis] = pos[axis] + dist
    
    return pos
end

pos = [0,0]

for i in instructions
    global pos = Move(i, pos)
end

print(prod(pos))