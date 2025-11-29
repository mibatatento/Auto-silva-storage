const express = require("express");
const fetch = require("node-fetch");
const app = express();
app.use(express.json());

// CONFIGURE AQUI:
const GITHUB_TOKEN = "SEU_TOKEN_AQUI";
const REPO = "SeuUser/SeuRepo";
const FILE_PATH = "links.txt";

app.post("/store", async (req, res) => {
    const content = `${JSON.stringify(req.body)}\n`;

    const apiUrl = `https://api.github.com/repos/${REPO}/contents/${FILE_PATH}`;

    // busca info do arquivo atual
    const getFile = await fetch(apiUrl, { headers: { Authorization: `token ${GITHUB_TOKEN}` } });
    const fileData = await getFile.json();

    let sha = fileData.sha || null;
    let oldContent = "";

    if (fileData.content) {
        oldContent = Buffer.from(fileData.content, "base64").toString();
    }

    const newContent = Buffer.from(oldContent + content).toString("base64");

    const update = await fetch(apiUrl, {
        method: "PUT",
        headers: {
            Authorization: `token ${GITHUB_TOKEN}`,
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            message: "Novo link salvo",
            content: newContent,
            sha: sha
        })
    });

    res.json({ status: "OK" });
});

app.listen(3000, () => console.log("API rodando na porta 3000"));
