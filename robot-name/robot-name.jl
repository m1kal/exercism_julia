using Random

robot_history = []

mutable struct Robot
    name
end

robotname = ()-> randstring('A':'Z',2)*randstring('0':'9',3)

function Robot()
    name = robotname()
    while name in robot_history
        name = robotname()
    end
    push!(robot_history,name)
    Robot(name)
end

function reset!(instance::Robot)
    instance.name = Robot().name
end

