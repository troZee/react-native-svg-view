import { NativeModules } from 'react-native';

type SvgViewType = {
  multiply(a: number, b: number): Promise<number>;
};

const { SvgView } = NativeModules;

export default SvgView as SvgViewType;
