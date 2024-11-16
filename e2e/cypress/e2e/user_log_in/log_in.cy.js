describe("Log in", function () {
  beforeEach(() => {
    cy.appFactories([["create", "user", { email: "user@example.com", password: "123123" }]]);
    cy.visit("/users/sign_in");
  });

  it("Success login with existing user with valid credentials", function () {
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("123123");
    cy.get(".actions > input").click();

    cy.get("body > :nth-child(2)").should("contain", "Úspešne prihlásený.");
  });

  it("Fail login with existing user with invalid credentials", function () {
    cy.get("#user_email").type("user@example.com");
    cy.get("#user_password").type("zleheslo");
    cy.get(".actions > input").click();

    cy.get("p").should("contain", "Neplatný Email alebo heslo.");
  });
});
