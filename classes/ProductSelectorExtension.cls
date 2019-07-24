public class ProductSelectorExtension {

    public ApexPages.StandardController theController;
    public Id oppId {get; set;}
    public List<SelectOption> productList { get; set; }
    public Id dummyId {get; set;}
    public List<OpportunityLineItem> olis = new List<OpportunityLineItem>();

    public ProductSelectorExtension(ApexPages.StandardController controller) {
    
        this.theController = controller;
        Opportunity opp = (Opportunity)controller.getRecord();
        this.oppId = controller.getId();
        
        if (opp != null) opp.StageName = 'Prospecting';
        
        // Get the product list
        this.productList = new List<SelectOption>();
        this.productList.add(new SelectOption('', '-- Select Product --'));
        for (PriceBookEntry pbe : [SELECT id, Name FROM PriceBookEntry where Pricebook2.IsStandard = true order by Name]) {
            this.productList.add(new SelectOption(pbe.id, pbe.name));         
        }
        System.debug('Product list size is ' + productList.size());
    }

    public List<OpportunityLineItem> getLineItems() {
        //List<OpportunityLineItem> olis = new List<OpportunityLineItem>();
        
        this.olis.add(createLineItem());
        this.olis.add(createLineItem());
        this.olis.add(createLineItem());
        
        return olis;
    }
    
    public OpportunityLineItem createLineItem() {
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = this.oppId;
    
        return oli;
    }
    
    public PageReference save() {
        Decimal amt = 1000;
        
        amt = olis[0].TotalPrice;
/*        for (OpportunityLineItem oli : olis) {
            amt = amt + oli.TotalPrice;    
        } */

        Opportunity opp = (Opportunity)theController.getRecord();
        opp.Amount = amt;
        
        upsert opp;
        
        return new PageReference('/'+opp.Id);
    }
    
    
}