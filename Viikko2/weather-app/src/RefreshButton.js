import { Button } from 'react-native-paper';
import { StyleSheet } from 'react-native';

const RefreshButton = () => {
  return (
    <Button style={styles.button} icon="refresh" mode="contained" buttonColor="#44700d" textColor="#bdff6e">
      Refresh
    </Button >
  );
}

const styles = StyleSheet.create({
  button: {
    margin: 10,
    padding: 10,

  },
});

export default RefreshButton;