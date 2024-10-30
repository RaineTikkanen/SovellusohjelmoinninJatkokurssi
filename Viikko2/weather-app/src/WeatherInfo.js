import { Text, View, Image, StyleSheet } from 'react-native';

const WeatherInfo = ({ weather, temp, wind, windDir }) => {
  return (
    <View style={styles.container}>
      <WeatherIcon weather={weather} />
      <Text style={styles.cityName}>{weather}</Text>
      <Text style={styles.info}>Temperature: {temp}°C</Text>
      <Text style={styles.info}>Wind: {windDir} {wind} m/s</Text>
    </View>
  );
}

const WeatherIcon = ({ weather }) => {
  switch (weather) {
    case 'Clear':
      return <Image source={require('../assets/sun.png')} style={styles.icon} />;
    case 'Clouds':
      return <Image source={require('../assets/cloud.png')} style={styles.icon} />;
    case 'Rain':
      return <Image source={require('../assets/rain.png')} style={styles.icon} />;
    case 'Snow':
      return <Image source={require('../assets/snow.png')} style={styles.icon} />;
    default:
      return <Image source={require('../assets/sun.png')} style={styles.icon} />;
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 4,
    marginTop: '50%',
  },
  cityName: {
    fontSize: 20,
    fontWeight: 'bold',
    paddingTop: 40,
    alignSelf: 'center',
  },
  info: {
    fontSize: 20,
    paddingTop: 20,
    alignSelf: 'center',
  },
  icon: {
    width: 100,
    height: 100,
    alignSelf: 'center',
    margin: 10,
  }
});

export default WeatherInfo;