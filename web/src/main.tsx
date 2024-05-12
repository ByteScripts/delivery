import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import { library } from "@fortawesome/fontawesome-svg-core";
import { isEnvBrowser } from "./utils/misc.ts";
import "./index.css";

library.add(fas, far, fab);

if (isEnvBrowser()) {
  const root = document.getElementById("root");

  root!.style.backgroundImage =
    'url("https://cdn.discordapp.com/attachments/942878135035248641/1238936562851385494/image.png?ex=66411916&is=663fc796&hm=b8aa62f9626de9eeed956ba3cdbc0413e985805596e9e521444a60afdd44e3ef&")';
  root!.style.backgroundSize = "cover";
  root!.style.backgroundRepeat = "no-repeat";
  root!.style.backgroundPosition = "center";
}

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
