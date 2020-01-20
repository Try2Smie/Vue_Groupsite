module.exports = {
    devServer: {
        proxy: {
            '/apis': {
                target: 'http://localhost:3000',
                changeOrigin: true, // 允许跨域
                pathRewrite: {
                    '^/apis': '/apis' // 所有以/apis开头的路径替换为统一接口'/apis'，需要与后端接口一致
                }
            }
        }
    }
}
