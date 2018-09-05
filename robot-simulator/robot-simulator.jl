struct Point{T}
    x::T
    y::T
end

Point(x::Tuple)=Point(x[1],x[2])

mutable struct Robot
    position
    heading
end

NORTH=0
EAST=1
SOUTH=2
WEST=3

position(robot::Robot) = Point(robot.position)
heading(robot::Robot) = robot.heading

function turn_right!(robot::Robot)
    robot.heading = mod(robot.heading + 1, 4)
end

turn_left!(robot::Robot) = (map(_->turn_right!(robot),1:3))

function advance!(robot::Robot)
    y=collect(robot.position)
    y[2-mod(robot.heading,2)] += (-1)^floor(robot.heading/2)
    robot.position=Tuple(y)
    robot
end

actions = Dict([('L',turn_left!),('R',turn_right!),('A',advance!)])

function move!(robot::Robot, path::String)
    map(action->actions[action](robot),collect(path))
end
