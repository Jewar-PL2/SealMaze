local state = require('state-manager')

function love.load()
    state.registerEvents()
    state.switch(require('states.menu'))
end