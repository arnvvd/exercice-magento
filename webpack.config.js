const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    context: path.resolve(__dirname, 'skin/frontend/room/default/'),
    entry: ['./js/main.js', './sass/main.scss'],
	output: {
		path: path.resolve(__dirname, 'skin/frontend/room/default/'),
		filename: './js/bundle.js'
    },
	module: {
		rules: [
		{
            test: /\.(js|jsx)$/,
			exclude: /(node_modules|bower_components)/,
			loader: 'babel-loader'
			//load .babelrc for react with Preact
		},
		{
			test: /\.scss$/,
			use: ExtractTextPlugin.extract({
				//postcss load postcss.config.js
				use: [
				    {
				        loader: 'css-loader',
                        options: {
                            sourceMap: true
                        }
                    },
                    {
                        loader: 'postcss-loader',
                        //load postcss.config.js with options plugins
                        options: {
                            sourceMap: 'inline'
                        }
                    },
                    {
                        loader: 'sass-loader'
                    }
                ]
			})
		}
		]
	},
    resolve: {
        alias: {
            'components': path.resolve(__dirname, 'src/components'),
            'core': path.resolve(__dirname, 'src/core'),
        },
        extensions: [
            '.js',
            '.jsx',
            '.json',
            '.scss'
        ]
    },
	devServer: {
        port: process.env.PORT || 8888,
        host: 'localhost',
        publicPath: '/',
        contentBase: './',
        historyApiFallback: true,
        open: true
	},
	plugins: [
		new ExtractTextPlugin({
			filename: '/css/styles.css'
		})
	]	
}