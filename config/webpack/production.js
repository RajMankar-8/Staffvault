const { environment } = require('@rails/webpacker');

// Update the node configuration to avoid errors related to unknown properties
environment.config.node = {
  __dirname: true,
  __filename: true,
  global: true,
};

module.exports = environment.toWebpackConfig();
