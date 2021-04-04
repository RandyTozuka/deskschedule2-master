const { environment } = require('@rails/webpacker')
// 以下追記 参考： https://qiita.com/tatsuhiko-nakayama/items/b2f0c77e794ca8c9bd74#webpack%E3%81%AE%E8%A8%AD%E5%AE%9A
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// ここまで
module.exports = environment
