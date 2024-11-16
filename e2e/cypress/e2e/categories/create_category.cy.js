describe("Create New Category", function () {
  beforeEach(() => {
    cy.loginWithFactory("user@example.com", "123123");
  });

  it("Create New Category", function () {
    cy.visit("/admin/categories");

    cy.contains("Pridat Kategoriu").click();
    cy.get("#category_name").type("Knihy");
    cy.contains("Ulozit zmeny").click();

    cy.get(".card-header").should("contain", "Knihy");
  });

  it("Edit Category", function () {
    cy.visit("/admin/categories");

    cy.contains("Pridat Kategoriu").click();
    cy.get("#category_name").type("Knihy");
    cy.contains("Ulozit zmeny").click();

    cy.get(".card-header").should("contain", "Knihy");

    cy.contains("Upraviť").click();
    cy.get("#category_name").clear();
    cy.get("#category_name").type("Auta");
    cy.contains("Ulozit zmeny").click();

    cy.get(".card-header").should("contain", "Auta");
  });

  it("Delete Category", function () {
    cy.visit("/admin/categories");

    cy.contains("Pridat Kategoriu").click();
    cy.get("#category_name").type("Knihy");
    cy.contains("Ulozit zmeny").click();

    cy.get(".card-header").should("contain", "Knihy");

    cy.contains("Vymazať").click();
    cy.get(".card-header").should("not.exist");
  });
});
