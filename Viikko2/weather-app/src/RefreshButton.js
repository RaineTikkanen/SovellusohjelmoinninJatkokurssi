import { Button } from 'react-native-paper';
import { StyleSheet } from 'react-native';

const RefreshButton = ({ city, fetchWeather }) => {
  return (
    <Button
      style={styles.button}
      icon="refresh"
      mode="contained"
      buttonColor="#44700d"
      textColor="#bdff6e"
      onPress={() => fetchWeather(city)}
    >
      Refresh
    </Button >
  );
}

const styles = StyleSheet.create({
  button: {
    margin: 10,
    padding: 10,
    position: 'absolute',
    bottom: 10,
    width: '95%',
  },
});


export default RefreshButton;