describe("first navagate to the main page", () => {
  beforeEach(() => {
      cy.visit('/')
  })

  it("add a products in the cart", () => {
    cy.get('button.btn').click({ force: true});
    cy.get('.nav-link').contains('My Cart (1)');
  })
})
