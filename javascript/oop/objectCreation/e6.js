
class Item {
  constructor(name, category, quantity) {
    this.sku = Item.buildSku(name, category);
    this.name = name;
    this.category = category;
    this.quantity = quantity;
  }
  
  static buildSku(name, category) {
    name = name.toUpperCase().split('');
    category = category.toUpperCase().split('');
    let sku = [];
    for (let i = 0; i < 5; i++) {
      if (name.length > 0 && i < 3) {
        sku.push(name.shift());
      } else {
        sku.push(category.shift());
      }
    }
    return sku.join('');
  }
  hasCategory(category) {
    return this.category === category;
  }

  inStock() {
    return this.quantity > 0;
  }
}

const ItemManager = (()=> {
  let validItemName = (name) => {
    return name.replace(/[^a-zA-Z]/g,'').length >= 5
  }
  let validCategory = (category) => {
    return !(/\s/g.test(category));
  }
  return {
    items: [],
    getItem(skuCode) {
      return this.items.filter(({sku}) => sku === skuCode)[0];
    },
    create(name, category, quantity){
      if (validItemName(name) && validCategory(category) && quantity >= 0) {
        this.items.push(new Item(name, category, quantity));
      }
    },
    update(skuCode, params) {
      let item = this.getItem(skuCode);
      for (property in params) {
        item[property] = params[property];
      }
    },
    delete(skuCode){
      this.items = this.items.filter(({sku}) => sku !== skuCode);
    },
    inStock(){
      return this.items.filter(item => item.inStock());
    },
    itemsInCategory(cat){
      return this.items.filter(item => item.hasCategory(cat));
    },
  }
})();
let ReportManager = {
  manager: null,
  init(mgr) {
    this.manager = mgr;
  },
  reportInStock() {
    let list = this.manager.inStock();
    let names = list.map(item => item.name);
    console.log(names.join(', '));
  },
  createReporter(skuCode) {
    let item = this.manager.getItem(skuCode);
    return {
      itemInfo() {
        for (property in item) {
          console.log(`${property}: ${item[property]}`);
        }
      },
    };
  },
}
ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(ItemManager.items);       
// returns list with the 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
console.log(ItemManager.items);
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10