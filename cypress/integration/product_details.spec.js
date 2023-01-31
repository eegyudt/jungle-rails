describe('jungle-rails app', () => {
  
  describe('The product Page', () => {

    it('successfully loads the home page and clicks on the product to load the product page', () => {
      cy.visit('http://localhost:3000') 
      cy.get(".products article").first().click()
    })

    it('successfully loads product page', () => {
      cy.visit('http://localhost:3000/products/1') 
    })
  })
})