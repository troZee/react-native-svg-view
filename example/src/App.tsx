import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import SvgView from 'react-native-svg-view';

export default function App() {
  return (
    <View style={styles.container}>
      <SvgView
        source="https://www.dropbox.com/s/d1dbdvo4l7xry4w/downdogflip.svg?raw=1"
        style={styles.svg}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  svg: {
    width: 50,
    height: 50,
  },
});
