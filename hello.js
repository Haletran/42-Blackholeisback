const http = require("http");
const fs = require("fs").promises;
const fetch = require("node-fetch");

const host = 'localhost';
const port = '8000';

async function fetchData() {
  const url = "https://api.intra.42.fr/v2/users/bapasqui/cursus_users";

  const options = {
    headers: {
      Authorization: "Bearer 08ed800ceb2070f07b8bc9fc4a0f46a88421683d169f8ec65e8f68ce144cc4f2",
    },
  };

  try {
    const response = await fetch(url, options);
    const data = await response.json();

    var test = data[0];
    return test.blackholed_at;
  } catch (error) {
    console.error("Une erreur s'est produite :", error);
    throw error;
  }
}

const requestListener = async function (req, res) {
  try {
    if (req.url === '/') {
      // Serve the HTML page
      const htmlPage = await fs.readFile('index.html', 'utf8');
      res.writeHead(200, { "Content-Type": "text/html" });
      res.end(htmlPage);
    } else if (req.url === '/data') {
      // Fetch data and send it as JSON
      const result = await fetchData();
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ result }));
    } else {
      // Handle other routes
      res.writeHead(404, { "Content-Type": "text/plain" });
      res.end("Not Found");
    }
  } catch (error) {
    res.writeHead(500, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ error: "Internal Server Error" }));
  }
};

const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on http://${host}:${port}`);
});
