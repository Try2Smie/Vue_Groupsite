module.exports = {
    devServer: {
        // port: 9000,
        // publicPath:'./',
        proxy: {
            '/apis': {
                target: 'http://localhost:3000',
                changeOrigin: true, // 允许跨域
                pathRewrite: {
                    '^/apis': '' // 所有以/apis开头的路径替换为''
                }
            }
        }
    }
}
