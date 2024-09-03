const { environment } = require('@rails/webpacker');

// Ensure that node properties are set correctly
environment.config.set('node', {
    __dirname: false,
    __filename: false,
});

module.exports = environment;
