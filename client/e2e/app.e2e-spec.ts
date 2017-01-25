import { BaitunnoorPage } from './app.po';

describe('baitunnoor App', function() {
  let page: BaitunnoorPage;

  beforeEach(() => {
    page = new BaitunnoorPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
