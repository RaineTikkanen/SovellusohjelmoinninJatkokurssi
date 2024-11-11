import { Text, View, StyleSheet } from 'react-native';
import { Button } from 'react-native-paper';

const CityList = ({ cities, setCity, toggleSearch, setSearch, setCities }) => {
  if (!cities || cities[0] === undefined) {
    return null;
  }
  return (
    <View style={styles.citylist}>
      {cities.map((city) => {
        return (
          <Button
            mode="text"
            key={[city.latitude, city.longitude]}
            onPress={() => {
              setCity(city)
              setSearch('')
              setCities(null)
              toggleSearch()
            }
            }>
            <Text style={styles.text}>{city.name}, {city.country}</Text>
          </Button>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  citylist: {
    padding: 20,
    backgroundColor: '#7ca845',
    position: 'absolute',
    top: 70,
    width: '100%',
  },
  text: {
    fontSize: 20,
    color: '#bdff6e',
  },
});

export default CityList;