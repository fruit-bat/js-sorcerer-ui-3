import { ExidyFileBinaryAjax, ExidySorcerer, ExidyBrowserKeyboard } from 'js-sorcerer';

const exidyFile = new ExidyFileBinaryAjax();
const exidySorcerer = new ExidySorcerer(exidyFile);
const exidyBrowserKeyboard = new ExidyBrowserKeyboard(exidySorcerer.keyboard);

//exidySorcerer.loadRomPack('Exidy Standard Basic Ver 1.0 (1978).ROM');
//exidySorcerer.loadRomPack('Exidy Z80 Development Pac (1979).ROM');
//exidySorcerer.loadRomPack('Exidy Word Processor Pac (1979).ROM');

export default {

	getKeyboard() {
		return exidySorcerer.keyboard;
	},

  getBrowserKeyboard() {
    return exidyBrowserKeyboard;
  },

	getCanvas() {
		return exidySorcerer.screenCanvas;
	},

	run() {
		exidySorcerer.run();
	},

	stop() {
		exidySorcerer.stop();
	},

  reset() {
    exidySorcerer.reset();
  },

  getDiskSystem() {
    return exidySorcerer.obtainDiskSystem();
  },

  getTapeSystem() {
    return exidySorcerer.obtainTapeSystem();
  },

  attachPrinter(printer) {
    exidySorcerer.centronics = printer;
  },

  insertRom(rom) {
    exidySorcerer.loadRomFromArray(rom);
  },

  ejectRom() {
    exidySorcerer.ejectRom();
  },

  govern(govern) {
    exidySorcerer.govern = govern;
  },

  getMem(start, length) {
    return exidySorcerer.getMem(start, length);
  },

  getMemRegions() {
    return exidySorcerer.getMemRegions();
  }
}
