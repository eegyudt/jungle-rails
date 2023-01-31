describe('jungle-rails app', () => {
  
  describe('Add Cart Button', () => {

    it('successfully loads the home page and clicks on Add Cart button', () => {
      cy.visit('http://localhost:3000') 
    })

    it("successfully renders products on the page and click the Add to Cart button", () => {
      cy.get(".products article").should("be.visible");
      cy.get(".products article .btn").first().click({force: true})
      cy.get(".end-0").should("contain", "(1)");
    });
  })
})