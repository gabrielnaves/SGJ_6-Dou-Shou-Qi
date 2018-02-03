gamemath = {}

function gamemath:distance(x1, y1, x2, y2)
    local xdist, ydist = x2 - x1, y2 - y1
    return math.sqrt(xdist*xdist + ydist*ydist)
end

function gamemath:midPoint(x1, y1, x2, y2)
    return {
        x = x1 + (x2 - x1)/2,
        y = y1 + (y2 - y1)/2
    }
end

function gamemath:theta(x1, y1, x2, y2)
    return math.deg(math.atan(y2 - y1, x2 - x1))
end
