geometry = {}

function geometry.makePoint(x, y)
    return { x = x, y = y }
end

function geometry.makeRect(x, y, width, height, pivotX, pivotY)
    pivotX = pivotX or 0.0
    pivotY = pivotY or 0.0
    return { x=x, y=y, width=width, height=height, pivotX=pivotX, pivotY=pivotY }
end

function geometry.isPointInRect(point, rect)
    local rx = rect.x - rect.width*rect.pivotX
    local ry = rect.y - rect.height*rect.pivotY
    return point.x > rx and point.x < rx+rect.width and
           point.y > ry and point.y < ry+rect.height
end
