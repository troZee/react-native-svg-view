import { requireNativeComponent } from 'react-native';
import type { StyleProp, ViewStyle } from 'react-native';

type SvgViewType = {
  style?: StyleProp<ViewStyle>;
  source: string;
};

const SvgView = requireNativeComponent<SvgViewType>('SvgView');

export default SvgView;
