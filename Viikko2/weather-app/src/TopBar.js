import { View, Text, StyleSheet } from 'react-native';
import { Button } from 'react-native-paper';

const TopBar = ({ headerText, toggleSearch }) => {
  return (
    <View style={styles.topbarContainer}>
      <Text style={styles.topbarText}>{headerText}</Text>
      <Button
        style={styles.button}
        icon="magnify"
        labelStyle={{ fontSize: 30 }}
        textColor="#bdff6e"
        onPress={toggleSearch}
      />
    </View>
  );
}


const styles = StyleSheet.create({
  topbarContainer: {
    paddingTop: 50,
    padding: 20,
    flexDirection: 'row',
    backgroundColor: '#44700d',
    justifyContent: 'center'
  },
  topbarText: {
    fontSize: 40,
    color: '#bdff6e',
  },
  button: {
    position: 'absolute',
    right: 10,
    top: 55,
  }
});

export default TopBar;