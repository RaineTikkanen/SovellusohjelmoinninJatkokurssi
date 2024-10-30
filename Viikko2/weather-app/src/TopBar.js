import { View, Text, StyleSheet } from 'react-native';

const TopBar = ({ headerText }) => {
  return (
    <View style={styles.topbarContainer}>
      <Text style={styles.topbarText}>{headerText}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  topbarContainer: {
    flex: 1,
    backgroundColor: '#44700d',
  },
  topbarText: {
    fontSize: 40,
    alignSelf: 'center',
    color: '#bdff6e',
    paddingTop: 50,
  },
});

export default TopBar;