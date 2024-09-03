process.env.NODE_ENV = process.env.NODE_ENV || 'production';

const environment = require('./environment');

// Ensure node configuration is set properly
environment.config.set('node', {
    __dirname: false,
    __filename: false,
});

module.exports = environment.toWebpackConfig();
