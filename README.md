# react-native-svg-view

`react-native-svg-view` is a wrapper on popular native svg libraries [Macaw](https://github.com/exyte/Macaw) and [Glide](https://github.com/bumptech/glide). This library allows you to read svg file from a url.

## Objecitve

You can find lots of libraries, which support svg in react native, but mostly of them are based on JSX or WebView approach. This library process svg data using a separate thread created on native side, so JS thread is not blocked due processing. Currently library supports data source from the internet.

## Installation

```sh
npm install react-native-svg-view
```

or

```sh
yarn add react-native-svg-view
```

## Usage

```jsx
import SvgView from 'react-native-svg-view';

<SvgView
  source="https://www.dropbox.com/s/d1dbdvo4l7xry4w/downdogflip.svg?raw=1"
  style={{ height: 24, width: 24 }}
/>;
```

## API

| Prop                         | Description     | Platform |
| ---------------------------- | --------------- | -------- |
| style?: StyleProp<ViewStyle> | component style | both     |
| source: string               | svg url         | both     |
|                              |                 |          |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## Alternatives

[react-native-svg](https://github.com/react-native-svg/react-native-svg)

[react-native-svg-uri](https://github.com/vault-development/react-native-svg-uri)

[react-native-svg-uri](https://github.com/aeirola/react-native-svg-asset-plugin)

## License

MIT
