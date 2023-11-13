async function fetchData() {
  const url = "https://api.intra.42.fr/v2/users/bapasqui/cursus_users";

  const options = {
    headers: {
      Authorization: "Bearer 4ba9c4e7041558bffd0efb04103a83e83b8efa7d1325f611d004b804326d0cc0",
    },
  };

  try {
    const response = await fetch(url, options);
    const data = await response.json();

    var test = data[0];
    console.log(test.blackholed_at);
  } catch (error) {
    console.error("Une erreur s'est produite :", error);
  }
}
fetchData();
