import {makeProject} from '@revideo/core';
import precision from './scenes/precision?scene';
export default makeProject({scenes: [precision], settings: {shared: {size: {x: 1600, y: 900}}}});
