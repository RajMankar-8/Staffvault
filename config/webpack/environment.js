const { environment } = require('@rails/webpacker')

// Optionally configure the node settings
environment.node = {
  __dirname: false,
  __filename: false,
  global: true,
}

// You can also customize loaders, plugins, etc. if needed.
// For example, adding Babel support:
const babelLoader = environment.loaders.get('babel')
babelLoader.exclude = /node_modules/

module.exports = environment
