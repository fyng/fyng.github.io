import {renderVideo} from '@revideo/renderer';
const file = await renderVideo({projectFile: './src/project.ts', settings: {logProgress: false, outFile: 'precision-safety-revideo.mp4',
  projectSettings: {exporter: {name: '@revideo/core/ffmpeg', options: {format: 'mp4'}}},
  puppeteer: {executablePath: process.env.CHROME_PATH, args: ['--no-sandbox']}}});
console.log('done', file);
