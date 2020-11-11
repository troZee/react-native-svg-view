import * as React from 'react';
import { SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native';
import SvgView from 'react-native-svg-view';
import dataSource from './datasource.json';

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView
        contentContainerStyle={styles.scrollContent}
        style={styles.container}
      >
        <Text style={styles.text}>React Native SVG View</Text>
        <View style={styles.content}>
          {dataSource.map((item) => (
            <SvgView key={item.id} source={item.img_url} style={styles.svg} />
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
