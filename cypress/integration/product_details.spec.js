describe("first navagate to the main page", () => {
  beforeEach(() => {
      cy.visit('/')
  })

  it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
});

it("redirect to the product details", () => {
  cy.get("[alt='Giant Tea']").click();
  cy.get(".product-detail p").contains('The Giant Tea is an uncommon')
});
})
