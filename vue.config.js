module.exports = {
  lintOnSave: false,
  chainWebpack: config => {
    config.module
      .rule('vue')
      .use('vue-loader')
      .loader('vue-loader')
      .tap(options => Object.assign(options, {
           transformAssetUrls: {
              'v-img': ['src', 'lazy-src'],
              'v-card': 'src',
              'v-card-media': 'src',
              'v-responsive': 'src',
              'v-carousel-item': 'src',
              //...
           }
           }))
  },
  configureWebpack: {
    devServer: {
      headers:          { 'Access-Control-Allow-Origin': '*' },
      https:            false,
      disableHostCheck: true
    }
  }
}
