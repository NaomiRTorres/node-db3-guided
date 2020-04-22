
const db = require('../data/db-config.js');

module.exports = {
    all,
    getById,
    create,
    update,
}

// implementation details
function all(){
    return db('users');
}


// get by id
function getById(id){
    return db('users')
    .where({ id })
    .first();
}


// post
function create(user){
    return db('users')
    .insert(user, 'id')
    .then(([id]) => {
        return getById(id);
    });
}

function update(id, changes) {
    return db('users')
    .where({ id })
    .update(changes)
    .then(() => {
        return getById(id)
    });
}