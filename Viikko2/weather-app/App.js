import { StyleSheet, SafeAreaView } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { useState, useEffect } from 'react';

import TopBar from './src/TopBar';
import WeatherInfo from './src/WeatherInfo';
import RefreshButton from './src/RefreshButton';
import SearchBar from './src/SearchBar';

export default function App() {
  const [search, setSearch] = useState('');
  const [showSearch, setShowSearch] = useState(false);
  const [city, setCity] = useState({ name: 'Tampere', lat: 61.498, lon: 23.7603 });
  const [weather, setWeather] = useState(null);

  useEffect(() => {
    fetchWeather(city);
  }, [city]);

  const toggleSearch = () => {
    setShowSearch(!showSearch);
  }

  const fetchWeather = async (city) => {
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${city.lat}&lon=${city.lon}&appid=45db5fa72e69fea5846b6a995fbe330f`;
    const response = await fetch(url);
    const data = await response.json();
    setWeather(data);
  }


  return (
    <SafeAreaView style={styles.container}>
      <StatusBar style="auto" />
      <TopBar
        headerText={city.name ? `${city.name}` : 'Weather App'}
        toggleSearch={toggleSearch} />
      <SearchBar
        search={search}
        setSearch={setSearch}
        showSearch={showSearch}
        setCity={setCity}
        toggleSearch={toggleSearch}
      />
      <WeatherInfo
        weather={weather}
      />
      <RefreshButton
        city={city}
        fetchWeather={fetchWeather}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    flex: 1,
    backgroundColor: '#dcffbf'
  },
});