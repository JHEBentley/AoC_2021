input = open("Day02/input.txt") do file
    readlines(file)
end

instructions = [split(instr, " ") for instr in input]

function Move(axis, pos, dist)
    pos[axis] = pos[axis] + dist
    return pos
end

function Evaluate(instruction, pos)
    dist = parse(Int, instruction[2])

    if instruction[1] == "forward"
        pos = Move(1, pos, dist)
        pos = Move(2, pos, dist * pos[3])
    else
        if instruction[1] == "up"
            dist = dist * -1
        end

        pos = Move(3, pos, dist)
    end
    return pos
end

#x, y, aim
pos = [0,0,0]

for i in instructions
    global pos = Evaluate(i, pos)
end

print(prod(pos[1:2]))