import { View, StyleSheet, TextInput } from 'react-native';

import { useState } from 'react';

import CityList from './CityList';

const SearchBar = ({ search, setSearch, showSearch, setCity, toggleSearch }) => {
  const [cities, setCities] = useState(null);
  const debounce = (func, delay) => {
    let timeoutId;

    return (...args) => {
      clearTimeout(timeoutId);

      timeoutId = setTimeout(() => {
        func.apply(this, args);
      }, delay);
    };
  };

  const fetchCity = async (search) => {
    const url = `http://api.openweathermap.org/geo/1.0/direct?q=${search}&limit&appid=45db5fa72e69fea5846b6a995fbe330f`;
    const response = await fetch(url);
    const data = await response.json();
    setCities(data);
  }

  const handleSearch = (search) => {
    setSearch(search);
    debounce(fetchCity(search), 10000);
  }

  if (!showSearch) {
    return null;
  }
  else {
    return (
      <View>
        <TextInput
          placeholder="Search"
          value={search}
          style={styles.searchBar}
          mode="view"
          onChangeText={handleSearch}
        />
        <CityList
          cities={cities}
          setCity={setCity}
          toggleSearch={toggleSearch}
          setSearch={setSearch}
          setCities={setCities}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  searchBar: {
    padding: 20,
    backgroundColor: '#7ca845',
    position: 'absolute',
    width: '100%',
  },
});


export default SearchBar;