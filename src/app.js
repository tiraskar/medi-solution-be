const express = require("express");
const cookieParser = require("cookie-parser");
const app = express();
const helmet = require("helmet");
const cors = require("cors");
const {
  authRoutes,
  patientRoutes,
  doctorRoutes,
  agentRoutes,
  testRoutes,
  testGroupRoutes,
  ledgerRoutes,
  BillingTitleMappingInfoRoutes,
  invoiceRoutes,
  BillingRoute,
  BillingInfoRoutes,
} = require("./routes");
const logger = require("./config/winstonLoggerConfig");
const errorHandler = require("./utils/errorHandler");
const { NODE_ENV, REACT_APP_URL } = require("./config");
const swaggerUI = require("swagger-ui-express");
const swaggerJsDoc = require("swagger-jsdoc");
const swaggerOptions = require("./config/swaggerUi");
const swaggerDocs = swaggerJsDoc(swaggerOptions);

const corsOptions = {
  origin: REACT_APP_URL,
  credentials: true,
};

app.use("*", cors(corsOptions));
app.use(helmet());
app.use(cookieParser());
app.use(express.json());

require("./config/database"); //database configuration

//swaggerUI documentation route
NODE_ENV == "development" &&
  app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(swaggerDocs));

//routes here
app.use("/api/auth", authRoutes);
app.use("/api/doctor", doctorRoutes);
app.use("/api/patient", patientRoutes);
app.use("/api/agent", agentRoutes);
app.use("/api/test", testRoutes);
app.use("/api/testgroup", testGroupRoutes);
app.use("/api/accounting", ledgerRoutes);
app.use("/api/master", BillingInfoRoutes);
app.use("/api/master", BillingTitleMappingInfoRoutes);
app.use("/api/billing", invoiceRoutes);

app.use(errorHandler);

// Serve uploads with CORS headers
// Serve uploads with proper CORS headers and cross-origin policy
app.use(
  "/uploads",
  cors({ origin: REACT_APP_URL, credentials: true }),
  express.static("uploads", {
    setHeaders: (res, path) => {
      res.setHeader("Cross-Origin-Resource-Policy", "cross-origin"); // allow cross-origin images
      res.setHeader("Access-Control-Allow-Origin", REACT_APP_URL);
    },
  })
);

app.use((req, res, next) => {
  logger.info(req.url);
  res.status(404).json({ message: "Page not found !!!" });
});

module.exports = app;
