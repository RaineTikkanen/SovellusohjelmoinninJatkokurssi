import { StyleSheet, View } from 'react-native';

import TopBar from './src/TopBar';
import WeatherInfo from './src/WeatherInfo';
import RefreshButton from './src/RefreshButton';

export default function App() {
  return (
    <View style={styles.container}>
      <TopBar headerText="Tampere" />
      <WeatherInfo
        weather="Clear"
        temp={-2}
        wind={5}
        windDir="NE"
      />
      <RefreshButton />
    </View>
  );
}


const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    flex: 1,
    backgroundColor: '#dcffbf'
  },
});