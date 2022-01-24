import * as React from 'react';
import {
  Platform,
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import SvgView from 'react-native-svg-view';

import dataSource from './datasource.json';
//@ts-ignore
import XMLParser from 'react-xml-parser';

const width = 40;
const height = 40;
const url =
  'https://www.autozone.com/cdn/icons/az_icons/product-finder-spark-plug-bg-full.svg';

// const url =
//   'https://www.autozone.com/cdn/images/B2C/US/content/product-finder/bg-product-finder-battery.svg';

// const url =
//   'https://www.autozone.com/cdn/images/B2C/US/content/product-finder/bg-product-finder-brake-fluid.svg';

export default function App() {
  const [path, setPath] = React.useState<string>('');
  React.useEffect(() => {
    fetch(url)
      .then((response) => response.text())
      .then((svg) => {
        const xml = new XMLParser().parseFromString(svg);
        for (let index = 0; index < xml.children.length; index++) {
          console.log(xml.children[index].attributes);
          xml.children[index].attributes.opacity = '1';
          xml.children[index].attributes.stroke = '#f00';
          xml.children[index].attributes.fill = '#f00';
          xml.children[index].attributes['fill-opacity'] = '1';
        }

        xml.attributes.height = `${width}`;
        xml.attributes.width = `${height}`;
        const parsedString = new XMLParser().toString(xml);
        setPath(parsedString);
      })
      .catch((e) => {
        console.log(e);
      });
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView
        contentContainerStyle={styles.scrollContent}
        style={styles.container}
      >
        <Text style={styles.text}>React Native SVG View Example</Text>
        <View style={styles.content}>
          {/* {dataSource.map((item) => (
            <SvgView key={item.id} source={item.img_url} style={styles.svg} />
          ))} */}
          {path && Platform.OS === 'ios' ? (
            <SvgView source={path} style={styles.svg} />
          ) : null}
          {/* {path && Platform.OS === 'android' ? (
            <SvgView source={url} style={styles.svg} />
          ) : null} */}
          {/* {path && Platform.OS === 'android' ? (
            <SvgView stringSource={path} style={styles.svg} />
          ) : null} */}
          {[
            'https://www.autozone.com/cdn/icons/az_icons/wiper-icon-rear.svg',
            'https://www.autozone.com/cdn/icons/az_icons/wiper-icon-passenger.svg',
            'https://www.autozone.com/cdn/icons/az_icons/wiper-icon-driver.svg',
            'https://www.autozone.com/cdn/icons/az_icons/product-finder-spark-plug-bg-full.svg',
            'https://www.autozone.com/cdn/images/B2C/US/content/product-finder/bg-product-finder-battery.svg',
            'https://www.autozone.com/cdn/images/B2C/US/content/product-finder/bg-product-finder-brake-fluid.svg',
          ].map((item) => (
            <SvgView key={item} source={item} style={styles.svg} />
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollContent: {
    padding: 20,
  },
  text: {
    fontSize: 20,
    fontWeight: 'bold',
    textAlign: 'center',
    marginTop: 16,
    marginBottom: 24,
  },
  content: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
  },
  svg: {
    width: 40,
    height: 40,
    margin: 4,
  },
});
