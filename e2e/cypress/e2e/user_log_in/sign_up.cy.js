describe("Log in", function () {
  beforeEach(() => {
    cy.visit("/users/sign_up");
  });

  it("Success sign up", function () {
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("123123");
    cy.get("#user_password_confirmation").type("123123");

    cy.get(".actions > input").click();

    cy.get("body > :nth-child(2)").should("contain", "Vitajte! Úspešne ste sa zaregistrovali.");
    cy.get(".d-flex > .nav-link").should("contain", "user@example.com");
  });

  it("Fail sign up - short password", function () {
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("123");
    cy.get("#user_password_confirmation").type("123");

    cy.get(".actions > input").click();

    cy.get("#error_explanation > ul > li").should(
      "contain",
      "Password je príliš krátky/a (min. 6 znakov)"
    );
  });

  it("Fail sign up - password confirmation", function () {
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("123456");
    cy.get("#user_password_confirmation").type("1");

    cy.get(".actions > input").click();

    cy.get("#error_explanation > ul > li").should(
      "contain",
      "Password confirmation nebolo potvrdené"
    );
  });
});
