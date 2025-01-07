const dotEnv = require("dotenv");
dotEnv.config();
const process = require("process");
const express = require("express");
const swaggerUi = require("swagger-ui-express");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = 3333;

const openapi_json = process.argv[2] || process.env.OPENAPI_JSON;
if (!openapi_json) {
  console.error("OpenAPI JSON is not set");
  process.exit(1);
}

const swaggerDocument = JSON.parse(
  fs.readFileSync(path.join(__dirname, openapi_json), "utf8")
);

// Serve Swagger UI
app.use("/", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.listen(PORT, () => {
  console.log(`Swagger UI available at http://localhost:${PORT}/`);
});
