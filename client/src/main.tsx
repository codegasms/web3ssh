import { Sepolia } from "@thirdweb-dev/chains";
import { ThirdwebProvider } from "@thirdweb-dev/react";
import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter as Router } from "react-router-dom";

import { App } from "./App";
import { StateContextProvider } from './context';
import "./index.css";


createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <ThirdwebProvider activeChain={Sepolia} clientId="ac95123ad2a75a0a66f6e6ae83691f54">
      <Router>
        <StateContextProvider>
          <App />
        </StateContextProvider>
      </Router>
    </ThirdwebProvider>
  </React.StrictMode>
);
