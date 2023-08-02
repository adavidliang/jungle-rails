

describe("first navagate to the main page", () => {

  it("jungle website", () => {
    cy.visit('http://127.0.0.1:3000')
  })

  it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
});

  it("There is 12 products on the page", () => {
  cy.get(".products article").should("have.length", 12);
});

})


